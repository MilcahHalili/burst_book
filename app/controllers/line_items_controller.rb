class LineItemsController < ApplicationController
 
    def destroy
        @line_item = LineItem.find(params[:id])
        @line_item.destroy
        redirect_to request.env["HTTP_REFERER"]
    end

    def inc
        @line_item = LineItem.find(params[:id])
        @line_item.quantity += 1
        @line_item.save
        redirect_to order_path('cart')
    end
    def dec
        @line_item = LineItem.find(params[:id])
        if @line_item.quantity <= 1
            @line_item.destroy
        else
            @line_item.quantity -= 1
            @line_item.save
        end
        redirect_to order_path('cart')
    end
end