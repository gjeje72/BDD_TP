import { formatDate } from "./index.js";

export default (orderRepo, Order, recipeRepo, userRepo) => {
  const listOrders = (_, res) => {
    res.send({
      data: orderRepo.listOrders()
    });
  };

  const getOrder = (req, res) => {
    const id = req.params.id;
    const order = orderRepo.findOrder(id);

    if (order) {
      return res.send({
        data: order
      });
    }

    res.status(404).send({
      error: `Order with id ${id} not found`
    });
  }

  const createOrder = (req, res) => {
    let {orderDate, recipeId, quantity, userId} = req.body;
    let user = userRepo.findUser(userId);
    if(!user){
      return res.status(404).send({
        error: `User with id ${userId} not found.`
      })
    }
    let recipe = recipeRepo.findRecipe(recipeId);
    if(!recipe){
      return res.status(404).send({
        error: `Recipe with id ${recipeId} not found.`
      })
    }

    const order = orderRepo.createOrder(
      new Order(
        null,
        orderDate,
        recipeId,
        quantity,
        userId,
      ));
      
      res.status(201).send({
      data: order
    });
  }

  const updateOrder = (req, res) => {
    let {id, orderDate, recipeId, quantity, userId} = req.body;
    let user = userRepo.findUser(userId);
    if(!user){
      return res.status(404).send({
        error: `User with id ${userId} not found.`
      })
    }
    let recipe = recipeRepo.findRecipe(recipeId);
    if(!recipe){
      return res.status(404).send({
        error: `Recipe with id ${recipeId} not found.`
      })
    }

    let formatedDate = formatDate(orderDate);
    let updatedOrder = orderRepo.updateOrder(
      id,
      new Order(id, formatedDate, recipeId, quantity, userId)
    );
    if(updatedOrder) {
      return res.send({
        data: updatedOrder
      });
    }

    res.status(404).send({
      error: `Order with id ${id} not found`
    });
  }

  const deleteOrder = (req, res) => {
    const id = req.params.id;
    const deletedOrder = orderRepo.deleteOrder(id);

    if(deletedOrder) {
      return res.send({
        meta: {
          deleted: deletedOrder
        }
      });
    }

    res.status(404).send({
      error: `Order with id ${id} not found`
    });
  }

  return {
    listOrders,
    getOrder,
    createOrder,
    updateOrder,
    deleteOrder
  }
}