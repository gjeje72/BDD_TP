import recipeRepo from './recipeRepo.js';
import listUsers from './userRepo.js';
import listOrders from './orderRepo.js';

export default (model) => ({
  recipeRepo: recipeRepo(model.Recipe),
  userRepo: listUsers(model.User),
  orderRepo: listOrders(model.Order)
});
