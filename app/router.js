'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  const secretOrPrivateKey = app.config.secret_private_key; // 密钥
  const secretOrPrivateSign = app.config.secret_private_sign; // 签名
  const auth = app.middleware.auth({ key: secretOrPrivateKey, sign: secretOrPrivateSign });

  router.get('/', controller.home.index);

  router.post('/task/add', auth, controller.task.add);
  router.post('/user/update', auth, controller.user.update);
  router.get('/user/token', controller.user.token);
  router.get('/user/decode_userinfo', auth, controller.user.decode_userinfo);

};
