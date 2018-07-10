class Api::V1::InfosController < ApplicationController
    protect_from_forgery with: :null_session

    def index
        @infos = Info.all
        render json: @infos
    end
    
    def create
        
        @file = params[:file]
        content = ''

        io = @file.path
        reader = PDF::Reader.new(io)
        reader.pages.each do |page|
            content = page.text
        end

        dir = Rails.root.join('tmp','uploads')
        Dir.mkdir(dir) unless Dir.exist?(dir)
        File.open(dir.join(@file.original_filename), 'wb') do |file|
            file.write(@file.read)
        end
        
        attachment = @file.original_filename
        attachment_dir = dir

        @info = Info.new(attachment: attachment, content: content, attachment_dir: attachment_dir)
        if @info.save
            render json: @info, status: :created
        else
            render json: @info.errors, status: :unprocessable_entity
        end
    end

    def destroy
        Info.destroy_all
    end
end