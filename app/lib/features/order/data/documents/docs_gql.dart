class DocsGql {
  static const getOrders = """ 
    query getOrders(\$id: Int) {
      orders(where: {user: {id: \$id}}, sort: "id:DESC") {
        id
        created_at
        deliveryFee
        subtotal
        total
        store{
          name
        }
        order_status{
          name,
          description
        }
        order_items{
          quantity
          product_name
          price
        }
      }
    }
  """;

  static const getOrder = '''
    query getOrder(\$id: ID!) {
      order(id: \$id) {
        id
        deliveryFee
        total
        created_at
        store {
          id
          name
        }
        payment_type {
          name
        }
        order_items {
          product {
            name
          }
          quantity
          price_unit
          price
        }
      }
    }
  ''';
}
