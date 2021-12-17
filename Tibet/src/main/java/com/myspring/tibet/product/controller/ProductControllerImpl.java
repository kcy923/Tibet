package com.myspring.tibet.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.tibet.board.service.BoardService;
import com.myspring.tibet.product.service.ProductService;
import com.myspring.tibet.product.vo.ProductVO;




@Controller("productController")
public class ProductControllerImpl {
	
	@Autowired
	private ProductService productService;	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/productlistName.do" ,method = RequestMethod.GET)
	public ModelAndView productlistName(ModelAndView mav) throws Exception {
		mav.setViewName("/productListName");
		mav.addObject("list", productService.productListName());
		return mav;
	}
	@RequestMapping(value="/productlistLowprice.do" ,method = RequestMethod.GET)
	public ModelAndView productlistLowprice(ModelAndView mav) throws Exception {
		mav.setViewName("/productListLowprice");
		mav.addObject("list", productService.productListLowprice());
		return mav;
	}	
	@RequestMapping(value="/productlistHighprice.do" ,method = RequestMethod.GET)
	public ModelAndView productlistHighprice(ModelAndView mav) throws Exception {
		mav.setViewName("/productListHighprice");
		mav.addObject("list", productService.productListHighprice());
		return mav;
	}	
	@RequestMapping(value="/productlistNew.do" ,method = RequestMethod.GET)
	public ModelAndView productlistNew(ModelAndView mav) throws Exception {
		mav.setViewName("/productListNew");
		mav.addObject("list", productService.productListNew());
		return mav;
	}
//	@RequestMapping("/productdetail{product_num}")
//	public ModelAndView detail(@PathVariable("product_num") String product_num, ModelAndView mav) throws Exception{
//		mav.setViewName("/productDetail");
//		mav.addObject("vo", productService.productDetail(product_num));
//		return mav;
//	}
	
	/* Áö¿öµµµÊ */
//	@RequestMapping("/productdetaila{product_num}")	public ModelAndView detail(@PathVariable("product_num") String product_num, HttpServletRequest request) throws Exception{
//		String viewName = (String)request.getAttribute("viewName");
//		ModelAndView mav1 = new ModelAndView();	
//		ModelAndView mav2 = new ModelAndView();	
//		mav1.setViewName("/productDetail");	
//		mav2.setViewName("/productDetail");	
//		mav1.addObject("vo", productService.productDetail(product_num));
//		mav2.addObject("vo", productService.productDetail(product_num));
//		return mav1, mav2;
//	}
	
	@RequestMapping("/productdetail{product_num}")
	public ModelAndView detail(@PathVariable("product_num") String product_num, ModelAndView mav) throws Exception{
		mav.setViewName("/productDetail");
		mav.addObject("vo", productService.productDetail(product_num));
		mav.addObject("prodQnasList", boardService.listProdQnas(product_num));
		return mav;
	}
}