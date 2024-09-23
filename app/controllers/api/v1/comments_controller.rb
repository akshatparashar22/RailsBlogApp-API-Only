class Api::V1::CommentsController < ApplicationController
    def index
        @article = Article.find_by(params[:article_id])
        @comment = @article.comments
        render json: @comment
    end
    def create
        @article = Article.find_by(params[:article_id])
        @comment = @article.comments.create(comment_params)
        render json: @comment, status: :created
      end
      
      def destroy
        @article = Article.find_by(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        head :no_content
      end
    
      private
        def comment_params
          params.require(:comment).permit(:commenter, :body, :status)
        end
end
