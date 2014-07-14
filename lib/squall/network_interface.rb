module Squall
  # OnApp NetworkInterface
  class NetworkInterface < Base
    # Public: Lists all network interfances for vm.
    #
    # Returns an Array.
    def list(vm_id)
      response = request(:get, "/virtual_machines/#{vm_id}/network_interfaces.json ")
      response.collect { |i| i['network_interface'] }
    end
  end
end
