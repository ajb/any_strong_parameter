require 'combustion'
Combustion.initialize! :action_controller
require 'rspec-rails'

RSpec.describe ActionController::Parameters do
  let(:params) do
    ActionController::Parameters.new({
      resource: {
        id: 'foo',
        custom_json: {
          bar: 'baz',
          qux: {
            quux: 1
          }
        }
      }
    })
  end

  it 'preserves the old behavior' do
    permitted = params.require(:resource).permit(
      custom_json: [:bar]
    )

    expect(permitted[:id]).to eq nil

    expect(permitted[:custom_json]).to eq(
      ActionController::Parameters.new(
        bar: 'baz'
      ).permit!
    )
  end

  it 'implmements AnyStrongParameter' do
    permitted = params.require(:resource).permit(
      custom_json: AnyStrongParameter::ANY
    )

    expect(permitted[:id]).to eq nil

    expect(permitted[:custom_json]).to eq(
      ActionController::Parameters.new(
        bar: 'baz',
        qux: {
          quux: 1
        }
      ).permit!
    )
  end

  it 'implements the test from https://github.com/rails/strong_parameters/pull/231' do
    params = ActionController::Parameters.new({
      :resource => {
        :id => 'foo',
        :custom_json => {
          :bar => 'baz',
          :qux => {
            :quux => 1
          }
        }
      }
    })
    permitted = params.permit(:resource => [{ :custom_json => AnyStrongParameter::ANY }])
    expect(permitted[:resource][:id]).to be_nil
    expect(permitted[:resource][:custom_json]).to_not be_nil
  end
end
