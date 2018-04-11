'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  router.get('/', controller.home.index);

  router.post('/task/add', controller.task.add);
  router.post('/user/update', controller.user.update);
  router.get('/user/token', controller.user.token);

};
