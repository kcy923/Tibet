package com.myspring.tibet.product.controller;


import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

public interface ProductController {
	public ModelAndView productlistNew(ModelAndView mav) throws Exception;
	public ModelAndView productlistLowprice(ModelAndView mav) throws Exception;
	public ModelAndView productlistHighprice(ModelAndView mav) throws Exception;
	public ModelAndView productlistName(ModelAndView mav) throws Exception;
	public ModelAndView detail(@PathVariable("product_num") String product_num, ModelAndView mav) throws Exception;
}
