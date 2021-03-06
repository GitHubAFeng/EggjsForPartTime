'use strict';

// had enabled by egg
// exports.static = true;

// 关闭csrf安全防御插件
exports.security = false;

//数据库
exports.mysql = {
  enable: true,
  package: 'egg-mysql',
};

//数据验证
//   exports.validate = {
//     enable: true,
//     package: 'egg-validate',
//   };

//日志
exports.logger = {
  enable: true,
  package: 'egg-logger',
};

//目前用户量不需要使用缓存……
// redis 缓存 
// exports.redis = {
//   enable: true,
//   package: 'egg-redis',
// };

// 文件上传
exports.multipart = {
  enable: true,
  package: 'egg-multipart',
};



