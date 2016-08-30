any_strong_parameter
====

This is a gemified version of the pull request in https://github.com/rails/strong_parameters/pull/231, tested with Rails 4.2.7.1 and Rails 5.0.0.

[This comment](https://github.com/rails/rails/issues/9454#issuecomment-242847373) explains it pretty well:

![img](http://take.ms/hKtWKi)

### Usage

```rb
# Given a params hash:
#
# {
#   product: {
#     name: 'Foo',
#     data: {
#       custom: 'metadata',
#       goes: 'here'
#     }
#   }
# }

def product_params
  params.require(:product).permit(
    :name,
    :description,
    data: AnyStrongParameter::ANY
  )
end

# =>
# {
#   name: 'Foo',
#   data: {
#     custom: 'metadata',
#     goes: 'here'
#   }
# }
```
