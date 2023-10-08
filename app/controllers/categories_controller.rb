class CategoriesController < ApplicationController
    def index
        @user = User.find(category_params[:user_id])
        @categories = @user.categories.order(order: :asc)
        render json: @categories
    end

    def create
        @category = Category.new(category_params)
        if @category.save 
            render json: @category
        else 
            render json: {error: @category.errors.messages, messages: "error in creating category"}, status: 422
        end
    end

    def update
        @category = Category.find(params[:id])
        if @category.update(category_params)
            render json: @category
        else
            render json: {error: @category.errors.messages, messages: "error in updating category"}, status: 422
        end
    end

    def destroy
        @category = Category.find(params[:id])
        if @category.destroy
            render json: {message: "category deleted successfuly"}
        else
            render json: {error: @category.errors.messages, messages: "error in deleting category"}, status: 422
        end
    end

    private

    def category_params
        params.permit(:name, :user_id, :order, :is_main)
    end
end
