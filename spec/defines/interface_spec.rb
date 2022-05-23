# frozen_string_literal: true

require 'spec_helper'

describe 'netplan::interface' do
  let(:title) { 'eth0' }
  let(:params) do
    {}
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      it do
        is_expected.to contain_file('/etc/netplan/91-eth0.yaml').with(
          'ensure' => 'present',
          'owner' => 'root',
          'group' => 'root',
          'mode' => '0644',
          'notify' => 'Exec[netplan apply]',
        ).with_content(%r{---\n# puppet managed file\nnetwork:\n  version: 2\n  ethernets:\n    'eth0':\n})
      end

      context 'with title => enps0' do
        let(:title) { 'enps0' }

        it do
          is_expected.to contain_file('/etc/netplan/91-enps0.yaml').with(
            'ensure' => 'present',
            'owner' => 'root',
            'group' => 'root',
            'mode' => '0644',
            'notify' => 'Exec[netplan apply]',
          ).with_content(%r{  ethernets:\n    'enps0':\n})
        end
      end

      context 'with match => true' do
        let(:params) do
          {
            'match' => true
          }
        end

        it do
          is_expected.to contain_file('/etc/netplan/91-eth0.yaml').with(
            'ensure' => 'present',
            'owner' => 'root',
            'group' => 'root',
            'mode' => '0644',
            'notify' => 'Exec[netplan apply]',
          ).with_content(%r{  ethernets:\n    'eth0':\n      match:\n})
        end

        context 'with match_name => eth0' do
          let(:params) do
            super().merge(
              {
                'match_name' => 'eth0'
              },
            )
          end

          it do
            is_expected.to contain_file('/etc/netplan/91-eth0.yaml').with_content(%r{  ethernets:\n    'eth0':\n      match:\n        name: 'eth0'\n})
          end
        end

        context 'with match_macaddress => 00:11:22:33:44:55' do
          let(:params) do
            super().merge(
              {
                'match_macaddress' => '00:11:22:33:44:55'
              },
            )
          end

          it do
            is_expected.to contain_file('/etc/netplan/91-eth0.yaml').with_content(%r{  ethernets:\n    'eth0':\n      match:\n        macaddress: 00:11:22:33:44:55\n})
          end
        end

        context 'with match_driver => ixgbe' do
          let(:params) do
            super().merge(
              {
                'match_driver' => 'ixgbe'
              },
            )
          end

          it do
            is_expected.to contain_file('/etc/netplan/91-eth0.yaml').with_content(%r{  ethernets:\n    'eth0':\n      match:\n        driver: ixgbe\n})
          end
        end
      end

      context 'with match => false' do
        let(:params) do
          {
            'match' => false
          }
        end

        it do
          is_expected.to contain_file('/etc/netplan/91-eth0.yaml').with(
            'ensure' => 'present',
            'owner' => 'root',
            'group' => 'root',
            'mode' => '0644',
            'notify' => 'Exec[netplan apply]',
          )
        end

        it do
          is_expected.not_to contain_file('/etc/netplan/91-eth0.yaml').with_content(%r{  ethernets:\n    'eth0':\n      match:\n})
        end

        context 'with match_name => eth0' do
          let(:params) do
            super().merge(
              {
                'match_name' => 'eth0'
              },
            )
          end

          it do
            is_expected.not_to contain_file('/etc/netplan/91-eth0.yaml').with_content(%r{  ethernets:\n    'eth0':\n      match:\n        name: 'eth0'\n})
          end
        end

        context 'with match_macaddress => 00:11:22:33:44:55' do
          let(:params) do
            super().merge(
              {
                'match_macaddress' => '00:11:22:33:44:55'
              },
            )
          end

          it do
            is_expected.not_to contain_file('/etc/netplan/91-eth0.yaml').with_content(%r{  ethernets:\n    'eth0':\n      match:\n        macaddress: 00:11:22:33:44:55\n})
          end
        end

        context 'with match_driver => ixgbe' do
          let(:params) do
            super().merge(
              {
                'match_driver' => 'ixgbe'
              },
            )
          end

          it do
            is_expected.not_to contain_file('/etc/netplan/91-eth0.yaml').with_content(%r{  ethernets:\n    'eth0':\n      match:\n        driver: ixgbe\n})
          end
        end
      end

      context 'with addresses => [192.168.0.2/24]' do
        let(:params) do
          {
            'addresses' => ['192.168.0.2/24']
          }
        end

        it do
          is_expected.to contain_file('/etc/netplan/91-eth0.yaml').with(
            'ensure' => 'present',
            'owner' => 'root',
            'group' => 'root',
            'mode' => '0644',
            'notify' => 'Exec[netplan apply]',
          ).with_content(%r{\n    'eth0':\n      addresses: \[192.168.0.2/24\]\n})
        end
      end

      context 'with addresses => [192.168.0.2/24,2001:1::2/64]' do
        let(:params) do
          {
            'addresses' => ['192.168.0.2/24', '2001:1::2/64']
          }
        end

        it do
          is_expected.to contain_file('/etc/netplan/91-eth0.yaml').with(
            'ensure' => 'present',
            'owner' => 'root',
            'group' => 'root',
            'mode' => '0644',
            'notify' => 'Exec[netplan apply]',
          ).with_content(%r{\n    'eth0':\n      addresses: \[192.168.0.2/24,2001:1::2/64\]\n})
        end
      end

      context 'with gateway4 => 192.168.0.1' do
        let(:params) do
          {
            'gateway4' => '192.168.0.1'
          }
        end

        it do
          is_expected.to contain_file('/etc/netplan/91-eth0.yaml').with(
            'ensure' => 'present',
            'owner' => 'root',
            'group' => 'root',
            'mode' => '0644',
            'notify' => 'Exec[netplan apply]',
          ).with_content(%r{\n    'eth0':\n      gateway4: 192.168.0.1\n})
        end
      end

      context 'with gateway6 => 2001:1::1' do
        let(:params) do
          {
            'gateway6' => '2001:1::1'
          }
        end

        it do
          is_expected.to contain_file('/etc/netplan/91-eth0.yaml').with(
            'ensure' => 'present',
            'owner' => 'root',
            'group' => 'root',
            'mode' => '0644',
            'notify' => 'Exec[netplan apply]',
          ).with_content(%r{\n    'eth0':\n      gateway6: 2001:1::1\n})
        end
      end

      context 'with dns => [1.1.1.1]' do
        let(:params) do
          {
            'dns' => ['1.1.1.1']
          }
        end

        it do
          is_expected.to contain_file('/etc/netplan/91-eth0.yaml').with(
            'ensure' => 'present',
            'owner' => 'root',
            'group' => 'root',
            'mode' => '0644',
            'notify' => 'Exec[netplan apply]',
          ).with_content(%r{\n    'eth0':\n      nameservers:\n        addresses: \[1.1.1.1\]\n})
        end
      end

      context 'with dns => [1.1.1.1,8.8.8.8]' do
        let(:params) do
          {
            'dns' => ['1.1.1.1', '8.8.8.8']
          }
        end

        it do
          is_expected.to contain_file('/etc/netplan/91-eth0.yaml').with(
            'ensure' => 'present',
            'owner' => 'root',
            'group' => 'root',
            'mode' => '0644',
            'notify' => 'Exec[netplan apply]',
          ).with_content(%r{\n    'eth0':\n      nameservers:\n        addresses: \[1.1.1.1,8.8.8.8\]\n})
        end
      end

      context 'with search => [zone1.com]' do
        let(:params) do
          {
            'search' => ['zone1.com']
          }
        end

        it do
          is_expected.to contain_file('/etc/netplan/91-eth0.yaml').with(
            'ensure' => 'present',
            'owner' => 'root',
            'group' => 'root',
            'mode' => '0644',
            'notify' => 'Exec[netplan apply]',
          ).with_content(%r{\n    'eth0':\n      nameservers:\n        search: \[zone1.com\]\n})
        end
      end

      context 'with search => [zone1.com,zone2.org]' do
        let(:params) do
          {
            'search' => ['zone1.com', 'zone2.org']
          }
        end

        it do
          is_expected.to contain_file('/etc/netplan/91-eth0.yaml').with(
            'ensure' => 'present',
            'owner' => 'root',
            'group' => 'root',
            'mode' => '0644',
            'notify' => 'Exec[netplan apply]',
          ).with_content(%r{\n    'eth0':\n      nameservers:\n        search: \[zone1.com,zone2.org\]\n})
        end
      end

      context 'with dhcp4 => true' do
        let(:params) do
          {
            'dhcp4' => true
          }
        end

        it do
          is_expected.to contain_file('/etc/netplan/91-eth0.yaml').with(
            'ensure' => 'present',
            'owner' => 'root',
            'group' => 'root',
            'mode' => '0644',
            'notify' => 'Exec[netplan apply]',
          ).with_content(%r{\n    'eth0':\n      dhcp4: true\n})
        end
      end

      context 'with dhcp4 => false' do
        let(:params) do
          {
            'dhcp4' => false
          }
        end

        it do
          is_expected.to contain_file('/etc/netplan/91-eth0.yaml').with(
            'ensure' => 'present',
            'owner' => 'root',
            'group' => 'root',
            'mode' => '0644',
            'notify' => 'Exec[netplan apply]',
          ).with_content(%r{\n    'eth0':\n      dhcp4: false\n})
        end
      end

      context 'with dhcp6 => true' do
        let(:params) do
          {
            'dhcp6' => true
          }
        end

        it do
          is_expected.to contain_file('/etc/netplan/91-eth0.yaml').with(
            'ensure' => 'present',
            'owner' => 'root',
            'group' => 'root',
            'mode' => '0644',
            'notify' => 'Exec[netplan apply]',
          ).with_content(%r{\n    'eth0':\n      dhcp6: true\n})
        end
      end

      context 'with dhcp6 => false' do
        let(:params) do
          {
            'dhcp6' => false
          }
        end

        it do
          is_expected.to contain_file('/etc/netplan/91-eth0.yaml').with(
            'ensure' => 'present',
            'owner' => 'root',
            'group' => 'root',
            'mode' => '0644',
            'notify' => 'Exec[netplan apply]',
          ).with_content(%r{\n    'eth0':\n      dhcp6: false\n})
        end
      end

      context 'with optional => true' do
        let(:params) do
          {
            'optional' => true
          }
        end

        it do
          is_expected.to contain_file('/etc/netplan/91-eth0.yaml').with(
            'ensure' => 'present',
            'owner' => 'root',
            'group' => 'root',
            'mode' => '0644',
            'notify' => 'Exec[netplan apply]',
          ).with_content(%r{\n    'eth0':\n      optional: true\n})
        end
      end

      context 'with optional => false' do
        let(:params) do
          {
            'optional' => false
          }
        end

        it do
          is_expected.to contain_file('/etc/netplan/91-eth0.yaml').with(
            'ensure' => 'present',
            'owner' => 'root',
            'group' => 'root',
            'mode' => '0644',
            'notify' => 'Exec[netplan apply]',
          ).with_content(%r{\n    'eth0':\n      optional: false\n})
        end
      end

      context 'with macaddress => 00:11:22:33:44:55' do
        let(:params) do
          {
            'macaddress' => '00:11:22:33:44:55'
          }
        end

        it do
          is_expected.to contain_file('/etc/netplan/91-eth0.yaml').with(
            'ensure' => 'present',
            'owner' => 'root',
            'group' => 'root',
            'mode' => '0644',
            'notify' => 'Exec[netplan apply]',
          ).with_content(%r{\n    'eth0':\n      macaddress: 00:11:22:33:44:55\n})
        end
      end

      context 'with order => 50' do
        let(:params) do
          {
            'order' => '50'
          }
        end

        it do
          is_expected.to contain_file('/etc/netplan/50-eth0.yaml').with(
            'ensure' => 'present',
            'owner' => 'root',
            'group' => 'root',
            'mode' => '0644',
            'notify' => 'Exec[netplan apply]',
          )
        end
      end
    end
  end
end
