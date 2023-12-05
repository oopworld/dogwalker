package com.dogwalker.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dogwalker.domain.CartVO;
import com.dogwalker.service.CartService;

@Controller
@RequestMapping("/items")
public class CartController {
	
	@Autowired
    private CartService cartService;
	
	/* 장바구니에 담기 */
	
    @PostMapping("/addCart") // /addCart URL로 POST 요청이 들어왔을 때 해당 메소드를 실행하도록 한다.
    @ResponseBody    //@ResponseBody 어노테이션을 사용하면 반환하는 값이 HTTP 응답 본문에 직접 작성된다.
    public String addCart(CartVO cart, HttpServletRequest request) throws Exception {
        //로그인 체크 -> 현재 사용자의 세션정보를 가져옵니다.
    	HttpSession session = request.getSession();
    	//세션에서 "id"라는 이름의 속성 값을 가져와 id 변수에 저장
    	String id = (String)session.getAttribute("id");
    	//로그인 여부 체크, 로그인 안됬을 경우 5를 반환
    	if(id == null) {
    		return "5";
    	}
    	 //'addCart' 메서드를 호출하여 카트 정보를 데이터베이스에 추가 성공적으로 추가했으면 1,이미 등록된 상품이면 0
    	int result = cartService.addCart(cart);
    	//현재 카트에 추가된 상품의 수량을 콘솔에 출력
    	System.out.println("quantity :"+ cart.getQuantity()); 
    	// 'addCart' 메서드의 결과값을 문자열로 변환하여 반환, result를 문자열로 변환하는 이유는 클라이언트에게 HTTP 응답 본문을 텍스트 형식으로 보내기 위함
    	return result + ""; 
    }
    
    /* 장바구니 목록 보기 */
    
    @GetMapping("/CartView")  // /CartView URL에 대한 GET 요청이 들어올 때 이 메소드를 실행하도록 지정
    public String getCart(Model model, HttpSession session) {
    	String id = (String)session.getAttribute("id");
    	if(session.getAttribute("id")==null) {
			return "redirect:/login";
		}
    	
    	
    	//로그인된 사용자의 ID를 사용하여 해당 사용자의 장바구니 목록을 가져온다. cartService.getCart(id)는 해당 ID를 가진 사용자의 장바구니 내의 모든 아이템 목록을 반환.
    	 List<CartVO> cartItems = cartService.getCart(id);
    	
    	//장바구니에 있는 모든 아이템의 가격과 수량을 곱한 값을 totalPrice에 누적하여 합산. 결과적으로 totalPrice는 장바구니의 총 가격이 된다.
    	int totalPrice = 0;
        for(CartVO item : cartItems) {
            totalPrice += item.getIt_price() * item.getQuantity(); // 상품의 가격과 수량을 곱하여 총 금액을 계산
        }
        //계산된 총 금액을 totalPrice라는 이름으로 뷰에 전달될 데이터 모델에 추가
        model.addAttribute("totalPrice", totalPrice); 
        //사용자의 장바구니 아이템 목록(cartItems)도 cartItems라는 이름으로 데이터 모델에 추가
    	model.addAttribute("cartItems", cartItems);
    	// /items/CartView 라는 이름의 뷰(주로 JSP 파일)를 반환하여 사용자에게 표시하도록 지정합니다. 이 뷰에서는 전달된 데이터 모델(totalPrice와 cartItems)을 사용하여 화면을 구성하게 됩니다.
        return "/items/CartView";
    }
    
    /* 장바구니 삭제*/
    
    @PostMapping("/deleteCart") 
    @ResponseBody
    //deleteCart 메소드는 cart_num이라는 파라미터를 필요로 한다. 삭제하려는 장바구니 아이템의 번호를 의미
    public Map<String, Object> deleteCart(@RequestParam int cart_num) {
    	//response는 이 메소드에서 클라이언트에게 반환할 데이터를 담을 맵
        Map<String, Object> response = new HashMap<>();
        try {
            //장바구니에서 물품을 삭제
            cartService.deleteCart(cart_num);
            response.put("success", true);
        } catch (Exception e) {
            response.put("success", false);
            response.put("deleteFail", "상품삭제 실패");
        }
        //response 맵을 반환합니다. @ResponseBody 어노테이션 때문에 이 맵은 JSON 형식으로 변환되어 HTTP 응답 본문에 포함되어 클라이언트에게 반환
        return response;
    }
    
    /* 장바구니 상품 수량 업데이트*/
    
    @PostMapping("/updateQuantity")
    @ResponseBody
    //mnodifyCount라는 메서드는 두 개의 파라미터(cart_num, quantity)를 받는다
    //@RequestParam: 클라이언트로부터 전송된 데이터 중 특정 파라미터를 추출해서 메서드의 인자로 넣어준다. 여기서는 cart_num과 quantity 값을 받아온다.
    public Map<String, Object> modifyCount(@RequestParam("cart_num") int cart_num, @RequestParam("quantity") int quantity) {
    	//메서드의 결과나 발생할 수 있는 예외를 담아서 클라이언트에게 반환할 Map 객체를 초기화한다.
        Map<String, Object> resultMap = new HashMap<String, Object>();

        try {
            // 해당 장바구니 아이템의 수량을 업데이트하는 메서드를 호출.
            cartService.modifyCount(cart_num, quantity);
            resultMap.put("success", true);
        } catch (Exception e) {
            resultMap.put("success", false);
            resultMap.put("error", e.getMessage());
        }
        
        return resultMap;
    }
   
}
