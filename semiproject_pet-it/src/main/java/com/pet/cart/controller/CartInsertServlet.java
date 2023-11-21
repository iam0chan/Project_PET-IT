package com.pet.cart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.cart.model.dao.CartDao;
import com.pet.cart.model.dto.Cart;
import com.pet.product.model.dto.Product;

@WebServlet("/CartInsertServlet")
public class CartInsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CartInsertServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // 사용자가 선택한 상품 정보를 받아오기
            String productNo = request.getParameter("productNo");
            String memberId = request.getParameter("memberId");
            int cartProductCount = Integer.parseInt(request.getParameter("cartProductCount"));
            String optionName = request.getParameter("optionName");
            String optionValue = request.getParameter("optionValue");

            // Cart 객체를 생성하여 정보 설정
            Cart cart = Cart.builder()
                    .productNo(productNo)
                    .memberId(memberId)
                    .cartProductCount(cartProductCount)
                    .optionName(optionName)
                    .optionValue(optionValue)
                    .build();

            // CartDao를 통해 장바구니에 상품 추가
            CartDao cartDao = new CartDao();
            cartDao.insertCart(request, cart);

            // 장바구니 페이지로 이동합니다.
            response.sendRedirect(request.getContextPath() + "/views/cart/cartList.jsp");

        } catch (NumberFormatException e) {
            // 예외 처리 코드 추가
            e.printStackTrace(); // 또는 로깅 등의 작업을 수행할 수 있습니다.
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid cartProductCount");
        }
    }
}