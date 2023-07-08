class HomeController < ApplicationController
  def index
    @user = current_user
    @search = Room.ransack(params[:q])
    @rooms = @search.result
  end
#中省略
  def search
#以下は検索に使うときの記述（変数やモデル名は変更してもいいですが
#".ransack(params[:q])"はそのままで使用します。）
    @search = Room.ransack(params[:q])

#以下は検索したものを表示する時に使う記述(一番シンプルで基本の形です)
    @rooms = @search.result
  end
end

