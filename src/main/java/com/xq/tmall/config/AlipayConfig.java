package com.xq.tmall.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2021000118605168";

	// 商户私钥，您的PKCS8格式RSA2私钥
	public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDPv//h7APJrrBRJHdogmYhMvl8hR9ANQhsrqEkJtfcv9Y4CkdLKJXHnwRw5xj4ZUyiW1V2mUNyKZ3kG8vsL2siyKTHvFA94vBfIsjgn3A2vQI6FH5Aq8vwEK2qnnhxjhCUhLTeC7tSDwau86wPMsBnovwRde6Pa022iCbIB8j4p5oVn6QPTtdeDv6IJySPUsCHBdfjrEsuCZJcIspmlJpi80Jr1+r+3JYsLgkbT8gTiK+7eNlro5HcVMKRfVqKbD8Vq8BwrjCqlQNgqpa22oZooePypyj0XHZjMyLEIaRPbmFB5v591ZZMJ3iTmtKdn9e0dJtMyxfVmGOj6RCb0dRZAgMBAAECggEAP1EfJbYO+Xr6VeCtW/bSNbAZha/09Fa1eJpIloIYLDlziqTnUarO64Y1jkuAusP09U6s33aarcKtUoZ+Qj+5gWJxhkaIljQCWpx5aKxvQN+ePCFe0UsK3uHWbDfcMY/A0eMYVMxyjPHzcYLmn8MyDOQJuzCcQq3Lg6Q/XZuxzsaJZcQTRHxa36WCEuvzkA3rqvl8BVTg2Lrof/C4YcuHI9m+FpUTbkr0t9yJOqth114LrelEtODpr5HWNScfIgWSLvHF7A/yv8LIsYKQO8H0c7/0pOmgdQgONc740zHX+tl3XT9BfxQpsZF+2UQsgxs5Ch8xDG+bMKYN4AxRnZ6IYQKBgQDwsPw1AazvNK5FZ6gpjCsjFyPFD2O7jdAYrO9DntAg1D/YoIHOeyyc1uZ00uIiYyVNCu0GTTeun79k8lTeRm2II52l4bAswjDAGV2U57F2TbG+4uvUqP+kJAeqWF0P8HAC3671wMEN0lP8Yfbs6jfge1ObeRqlwFWwTpRKLnDOVQKBgQDc9qcPfCsNqcUvCOMsyssvTghHs0gmDBe54o4Im0TpU6FeQU/Hn/tMHkexg9049+6p37mZDraM3y6HFXBbivbx8mON2/8U2uodPCJbQ/GDR495+TjjrcMows6x/cRIVXCC2cpW8QsXE9dtZMqOHveJPS0OwBJEZrUR15JTNM3p9QKBgBdFBR0azF1T+oU7QEbEBmeeFRc4Jaw8SaIZFgizkeuamZGX8vTDc8y1+hHRUYuBilmodMHnNTrsttRLmWjj5jMDPnqLFz08iPoJecKro7yMRmLuDV7B9/Umhpcxc83WsP2WIpQfzopHi1cbIYRGIKDTS4H8c1cTATXKYwvI8Z8BAoGBAMkTE1d+ENewJCX3GnPKXze+9L36oa8t1fFr/wBJ+12wounY2Ta5mL7d1zPs4UVUKTUgyA5GW0y6U+bNVZ+YR7xIbNvM1MUvqVfNPx56J67lUeUXK/PUTgIrtFg4q4N/bJFGi2CunP71KVb9H25RM8UJjJUdqAHizOddmmRpavB5AoGAPwRYJ0dOgD1F0TUsEEna05kXz85flO9/OaxRji+YKvopWkUql8GBWHjx9Dj1DvYlPMA9dJhJEYYwzISNcuyaqIYa5piuevTXLL6ITWoJJ8VwbCrdd6xClJR+wzQAdeCKH6/4Ll2GD8TyRhzY36ITlCFmWDHanEqCuKePIKAlcfA=";

	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
	public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuSzSatt8C7/wMC6prYsPXaocqEnteWR/ST4b2t+vVjOU4feXvXSX3mMLJYL/BNzHcD8IvsmsFXAi9xn/hvrch1TaQ7CeV9O3NMwdblT3n4eBwLRU1Ozl7xiIQOd2kuJ+oTh0By2i7TxSLowp/QbphgdVWTCdzvVYe4pcFLhSVL9P4X9TtXhFOFEcFoTKRJNNlZ8296tPc/Eg3Ufen0ZU3RavNRS8qxzn6UCrY1lY7bmfeu4yiF/uGljqpGs8enbB7R9PEypSFf3QiOONWvYyrzoVXrGL7ka7FBLHeDjBGbM0W8pS6E6JqMJbstYFZKT2SiO6gA/ZzqkWKbF9XsV61QIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8082/tmall/order/completePay";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8082/tmall/order/pay/success";
//	public static String return_url = "http://localhost:8082/tmall/order/completePay";
	// 签名方式
	public static String sign_type = "RSA2";

	// 字符编码格式
	public static String charset = "utf-8";

	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

	// 日志路径
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

	/**
	 * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
	 * @param sWord 要写入日志里的文本内容
	 */
	public static void logResult(String sWord) {
		FileWriter writer = null;
		try {
			writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
			writer.write(sWord);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (writer != null) {
				try {
					writer.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
