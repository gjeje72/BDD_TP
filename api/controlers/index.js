import statusCtrl from './statusCtrl.js';
import recipeCtrl from './recipeCtrl.js';
import userCtrl from './userCtrl.js';
import orderCtrl from './orderCtrl.js';

export function formatDate(date) {
  var d = new Date(date),
      month = '' + (d.getMonth() +1),
      day = '' + d.getDate(),
      year = d.getFullYear();

  if (month.length < 2) {
    month = '0' + month;
  }
  if (day.length < 2) {
    day = '0' + day;
  }

  return [year, month, day].join('-');
}

export default (repository, model) => ({
  statusCtrl,
  recipeCtrl: recipeCtrl(repository.recipeRepo),
  userCtrl: userCtrl(repository.userRepo, model.User),
  orderCtrl: orderCtrl(repository.orderRepo, model.Order, repository.recipeRepo, repository.userRepo),
});
