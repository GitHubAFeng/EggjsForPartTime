'use strict';
const jwt = require('jsonwebtoken');
module.exports = options => {
    return async function auth(ctx, next) {
        //获取请求头Authorization参数并分割出token
        const token = ctx.get('Authorization').split(/[\s]/)[1];
        // console.log('token:', token);
        if (token == '' || token == 'undefined') {
            ctx.status = 403;
            ctx.body = { "code": 1, "msg": "需要登录后操作", "data": "" };
            return;
        } else {
            jwt.verify(token, options.key, function (err, decode) {
                if (err) {
                    let msg = "";
                    switch (err.name) {
                        case 'TokenExpiredError':
                            msg = '登录验证超时，请重新登录';
                            break;

                        case 'JsonWebTokenError':
                            msg = 'Token验证错误，请重新登录';
                            break;

                        default:
                            msg = '登录验证错误，请重新登录';
                            break;
                    }

                    ctx.status = 403;
                    ctx.body = { "code": 1, "msg": msg, "data": '' };
                    return;
                } else {
                    const sign = decode.key.sign;
                    ctx.locals.uid = decode.key.uid;  //把UID挂在上下文中，方便其它地方获取
                    // console.log('sign:', sign);
                    if (sign != options.sign) {
                        ctx.body = { "code": 1, "msg": "Token验证错误，请重新登录", "data": '' };
                        return;
                    }
                }
            })
        }

        await next();

    };
};