# frozen_string_literal: true

module Admin
  class BadgesController < Admin::BaseController
    before_action :set_badge, only: %i[edit show update destroy]

    def new
      @badge = Badge.new
    end

    def create
      @badge = Badge.new(badge_params)
      if @badge.save
        redirect_to admin_badges_path, notice: t('.success')
      else
        render :new
      end
    end

    def edit; end

    def index
      @badges = Badge.all
    end

    def update
      if @badge.update(badge_params)
        redirect_to [:admin, @badge], notice: t('.success')
      else
        render :edit
      end
    end

    def show; end

    def destroy
      @badge.destroy
      redirect_to admin_badges_path, notice: t('.success')
    end

    private

    def badge_params
      params.require(:badge).permit(:title, :image, :rule_name, :rule_value)
    end

    def set_badge
      @badge = Badge.find(params[:id])
    end
  end
end
