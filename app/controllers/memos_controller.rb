class MemosController < ApplicationController
  
  before_action :authenticate_user
  
  def new
    @memo = Memo.new
  end
  
  def create
    @memo = Memo.new(content: params[:content], user_id: @current_user.id)
    
    if @memo.save
      flash[:notice] = "投稿しました"
      redirect_to("/memos/list")
    else
      render("memos/new")
    end
    
  end
  
  def list
    @memos = Memo.where(user_id: @current_user.id).order(created_at: :desc)
    #@memos = Memo.all.order(created_at: :desc)
  end
  
  def show
    @memo = Memo.find_by(id: params[:id])
    @user = @memo.user
  end
  
  def edit
    @memo = Memo.find_by(id: params[:id])
  end

  def update
    @memo = Memo.find_by(id: params[:id])
    @memo.content = params[:content]
    if @memo.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/memos/list")
    else
      render("memos/edit")
    end
  end
  
  def destroy
    @memo = Memo.find_by(id: params[:id])
    @memo.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/memos/list")
  end
  
  def like
    @memo = Memo.find_by(id: params[:id])
    @memo.like = 1
    @memo.save
    redirect_to("/memos/list")
  end
  
  def unlike
    @memo = Memo.find_by(id: params[:id])
    @memo.like = 0
    @memo.save
    redirect_to("/memos/list")
  end

end
