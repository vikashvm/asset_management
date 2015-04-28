class ApiController < ApplicationController

	# GET /api/available
	def get_available_inventory
		@inventories = Inventory.available
		render 'inventories.json.jbuilder'#, status: :created, location: @inventories
	end

	# GET /api/issued
	def get_issued_inventory
		@inventories = Inventory.issued
		render 'inventories.json.jbuilder'#, status: :created, location: @inventories
	end

	# GET /api/config
	def get_config
		logger.info "hellooooo"
	end

	# GET /api/retired
	def get_retired_inventory
		@inventories = Inventory.retired
		render 'inventories.json.jbuilder'#, status: :created, location: @inventories
	end

	# POST /api/issue, params: serial_no, xid
	def issue_inventory
		@inventory = Inventory.find_by status: 'Available', serial_no: params[:serial_no]
		if @inventory and @inventory.update_attributes(xid: params[:xid], status: 'Issued')
			render 'inventory.json.jbuilder'
		else
			render json: {message: "Sorry, It seems like we have encountered an error"}, status: :unprocessable_entity
		end
	end

	# POST /api/return, params: serial_no
	def return_inventory
		@inventory = Inventory.find_by status: 'Issued', serial_no: params[:serial_no]
		if @inventory and @inventory.update_attributes(xid: nil, status: 'Available')
			render 'inventory.json.jbuilder'
		else
			render json:  {message: "Sorry, It seems like we have encountered an error"}, status: :unprocessable_entity
		end
	end

	# POST /api/retire, params: serial_no
	def retire_inventory
		@inventory = Inventory.find_by status: 'Available', serial_no: params[:serial_no]
		if @inventory and @inventory.update_attributes(xid: nil, status: 'Retired')
			render 'inventory.json.jbuilder'
		else
			render json:  {message: "Sorry, It seems like we have encountered an error"}, status: :unprocessable_entity
		end
	end
end
