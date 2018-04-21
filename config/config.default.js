'use strict';

module.exports = appInfo => {
  const config = exports = {};

  config.root = 'http://39.108.223.5';

  config.appid = 'wx36dfce1bfe86b036';
  config.appsecret = 'b7c7c05212a607a520e026d094dfcd3a';


  config.secret_private_key = 'afeng';  //token密钥，盐值
  config.secret_private_sign = 'afeng123456'; //token 签名，用来验证客户端发来的token

  //token过期时间
  config.secret_private_time = 60 * 60 * 24;  //token有效时间，例如24小时 60 * 60 * 24 

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1523340330306_155';

  // add your config here
  config.middleware = [];

  //忽略JSON验证，客户端发起POST请求时需要在Header携带 content-type：application/json
  exports.security = {
    csrf: {
      ignoreJSON: true, // 默认为 false，当设置为 true 时，将会放过所有 content-type 为 `application/json` 的请求
    },
  };


  exports.mysql = {
    // 单数据库信息配置
    client: {
      // host
      host: '127.0.0.1',
      // 端口号
      port: '3306',
      // 用户名
      user: 'parttime',
      // 密码
      password: 'KtaCN4L6MhsN6FCY',
      // 数据库名
      database: 'parttime',
    },
    // 是否加载到 app 上，默认开启
    app: true,
    // 是否加载到 agent 上，默认关闭
    agent: false,
  };

//目前用户量不需要使用缓存…… 需要时到插件中开启
  config.redis = {
    client: {
      port: 6379,          // Redis port
      host: '127.0.0.1',   // Redis host
      password: 'afeng',
      db: 0,
    },
  }

  //日志目录
  exports.logger = {
    appLogName: `${appInfo.name}-debug.log`,
  }

  //上传插件，文件类型白名单
  exports.multipart = {
    whitelist: [
      '.jpg', '.jpeg', // image/jpeg
      '.png', // image/png, image/x-png
      '.gif', // image/gif
    ],
    fileSize: '5mb', //大小限制
  }



  return config;
};
