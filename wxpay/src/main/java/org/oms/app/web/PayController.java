package org.oms.app.web;

import javax.servlet.http.HttpServletRequest;

import org.oms.app.model.MdlPay;
import org.oms.app.service.WXPay;
import org.oms.app.service.WXPrepay;
import org.oms.app.util.OrderUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("pay")
public class PayController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	//通知回调地址
	String notifyUrl = "http://jackssybin.cn/wxpay/notice";
	public PayController(){
		
	}

	/**
	 * 获取并填写支付参数 
	 * @param appId
	 * @param partnerId
	 * @param partnerKey
	 * @param model
	 * @return
	 */
	@RequestMapping("/config")
	public String config(String appId,String partnerId,String partnerKey, ModelMap model) {
		MdlPay pay = new MdlPay();
		pay.setAppId(appId);
		pay.setPartnerId(partnerId);
		pay.setPartnerKey(partnerKey);
		logger.info("pay对象初始化：" + pay);
		model.addAttribute("pay", pay);
		return "forward:wxpay";
	}

	/**
	 * 微信支付主方法
	 * @param request
	 * @param pay
	 * @param model
	 * @return
	 */
	@RequestMapping("/wxpay")
	public String pay(HttpServletRequest request,MdlPay pay, Model model) {
		String spbill_create_ip = request.getRemoteAddr();
		WXPrepay prePay = new WXPrepay();
		prePay.setAppid(pay.getAppId());
		prePay.setBody("来自jackssy的微信支付测试");
		prePay.setPartnerKey(pay.getPartnerKey());
		prePay.setMch_id(pay.getPartnerId());
		prePay.setNotify_url(notifyUrl);
		prePay.setOut_trade_no(OrderUtil.GetOrderNumber(""));
		prePay.setSpbill_create_ip(spbill_create_ip);
		prePay.setTotal_fee("1");
		prePay.setTrade_type("JSAPI");
		prePay.setOpenid("o5pDLwg2CkwLIbQ-DcvCT0XsHCr4");
        //此处添加获取openid的方法，获取预支付订单需要此参数！！！！！！！！！！！ 
		// 获取预支付订单号
		String prepayid = prePay.submitXmlGetPrepayId();
		logger.info("获取的预支付订单是：" + prepayid);
		if (prepayid != null && prepayid.length() > 10) {
			// 生成微信支付参数，此处拼接为完整的JSON格式，符合支付调起传入格式
			String jsParam = WXPay.createPackageValue(pay.getAppId(), pay.getPartnerKey(), prepayid);
			System.out.println("jsParam=" + jsParam);
			// 此处可以添加订单的处理逻辑
			model.addAttribute("jsParam", jsParam);
			logger.info("生成的微信调起JS参数为：" + jsParam);
		}
		model.addAttribute("prepayid", prepayid);
		return "wxpay";
	}
}