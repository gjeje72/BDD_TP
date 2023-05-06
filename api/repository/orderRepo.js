import { v4 as uuidv4 } from 'uuid';

export default (Order) => {
  let orders = [
    new Order(
      'df161443-770d-4d28-b7c2-35392021b932',
      '2023-04-23',
      'a35ce12d-d52b-4a07-90ad-68e985b779e7',
      '5',
      '6c84fb90-12c4-11e1-840d-7b25c5ee775a'
    ),
    new Order(
      'an161443-770d-4d28-b7c2-35392021b932',
      '2023-02-12',
      'a35ce12d-d52b-4a07-90ad-68e985b779e7',
      '1',
      '6c84fb90-12c4-11e1-840d-7b25c5ee775a'
    )
  ];

  const listOrders = () => {
    return orders;
  };

  const findOrder = (id) => {
    return orders.find((order) => order.id === id);
  }

  const createOrder = (orderData) => {
    const order = new Order(
      uuidv4(),
      orderData.orderDate,
      orderData.recipeId,
      orderData.quantity.toString(),
      orderData.userId
    );

    orders.push(order);
    return order;
  }

  const updateOrder = (id, orderData) => {
    let foundOrderIdx = -1;
    orders.forEach((order, idx) => {
      if (order.id === id) {
        foundOrderIdx = idx;
      }
    });

    if (foundOrderIdx > -1) {
      orders[foundOrderIdx] = Object.assign(orders[foundOrderIdx], orderData);
      return orders[foundOrderIdx];
    }

    return null;
  }

  const deleteOrder = (id) => {
    let orderToDeleteIndex = orders.findIndex((b) => b.id === id);

    if (orderToDeleteIndex > -1) {
      let deletedOrder = orders.splice(orderToDeleteIndex, 1)[0];
      return deletedOrder;
    }

    return null;
  }

  return {
    listOrders,
    findOrder,
    createOrder,
    updateOrder,
    deleteOrder
  }
}