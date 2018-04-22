'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  const secretOrPrivateKey = app.config.secret_private_key; // 密钥
  const secretOrPrivateSign = app.config.secret_private_sign; // 签名
  const auth = app.middleware.auth({ key: secretOrPrivateKey, sign: secretOrPrivateSign }); //token验证

  router.get('/', controller.home.hello);
  router.get('/cEMwUCopyg.txt', controller.home.index);

  router.post('/task/add', auth, controller.task.add);
  router.post('/task/upload', auth, controller.task.upload);
  router.get('/task/getlist', auth, controller.task.getlist);
  router.get('/task/getdetail', auth, controller.task.getdetail);
  router.post('/user/update', auth, controller.user.update);
  router.get('/user/token', controller.user.token);
  router.get('/user/decode_userinfo', auth, controller.user.decode_userinfo);
  router.get('/user/get', auth, controller.user.getUserInfo);
  router.get('/comments/getlist', auth, controller.comments.getlist);
  router.post('/comments/add', auth, controller.comments.add);



};
