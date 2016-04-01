module Squall
  # OnApp NetworkInterface
  class NetworkInterface < Base
    # Public: Lists all network interfances for vm.
    #
    # Returns an Array.
    def list(vm_id)
      response = request(:get, "/virtual_machines/#{vm_id}/network_interfaces.json")
      response.collect { |i| i['network_interface'] }
    end
    
    # Public: Add Network Interface to VS
    # vm_id - ID of the virtual machine
    #
    # options - Params for adding the network interface to virtual machine:
    #           label                           - Label of a network
    #           rate_limit                      - Port speed of a network interface you wish to attach
    #           network_join_id                 - ID of a physical network used to attach this network interface
    #           primary                         - 1 if the interface is primary. Otherwise false.
    #
    # Example
    #     create(
    #       label:             'lan',
    #       rate_limit:        100,
    #       network_join_id:   2,
    #       primary:           0
    #     )
    #
    # Returns a Hash.
    def create(vm_id, options = {})
      response = request(:post, "/virtual_machines/#{vm_id}/network_interfaces.json", default_params(options))
      response['virtual_machine']
    end
  end
end
