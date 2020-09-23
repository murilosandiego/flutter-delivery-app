"use strict";

/**
 * Read the documentation (https://strapi.io/documentation/v3.x/concepts/controllers.html#core-controllers)
 * to customize this controller
 */

const { sanitizeEntity } = require("strapi-utils");

module.exports = {
  async create(ctx) {
    let entity;
    const { store, comments, payment_type, order_items } = ctx.request.body;

    let subtotal = 0;
    let total = 0;

    const storeQuery = await strapi.services.store.findOne({ id: store.id });

    var orderItemsSaved = await Promise.all(
      order_items.map(async (item) => {
        const product = await strapi.services.product.findOne({
          id: item.product.id,
        });

        subtotal += product.price * item.quantity;

        return strapi.query("order-item").create({
          product,
          quantity: item.quantity,
          comments: item.comments,
          price: product.price * item.quantity,
          price_unit: product.price,
          product_name: product.name,
        });
      })
    );

    total = storeQuery.deliveryFee
      ? storeQuery.deliveryFee + subtotal
      : subtotal;

    const orderStatus = await strapi
      .query("order-status")
      .findOne({ sequence: 1 });

    entity = await strapi.services.order.create({
      user: ctx.state.user.id,
      store,
      comments,
      payment_type,
      deliveryFee: storeQuery.deliveryFee,
      order_items: orderItemsSaved,
      order_status: orderStatus,
      subtotal,
      total,
    });

    return sanitizeEntity(entity, { model: strapi.models.order });
  },
};
