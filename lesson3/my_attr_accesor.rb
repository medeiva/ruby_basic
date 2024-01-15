module MyAttrAccesor
  def attr_accessor_with_history(*names)
    names.each do |name|
        var_name = "@#{name}".to_sym
        var_name_history = "@#{name}_history".to_sym
        define_method(name) { instance_variable_get(var_name)}

        define_method("#{name}=".to_sym) do |value| 
          history = instance_variable_get(var_name_history)
          history ||= []
          history.push(value)
          instance_variable_set(var_name_history, history) 
          instance_variable_set(var_name, value) 
        end
        
        define_method("#{name}_history".to_sym) {instance_variable_get(var_name_history)}

    end
  end

  def strong_attr_accessor(name, type)
    var_name = "@#{name}".to_sym

    define_method(name) { instance_variable_get(var_name) }

    define_method("#{name}=") do |value|
      raise "Неправильный тип, ожидается тип #{type}" unless value.is_a?(type)

      instance_variable_set(var_name, value)
    end
  end
end

class Test
  extend MyAttrAccesor

  attr_accessor_with_history :a
end

t =  Test.new
t.a = 5
t.a = 2
t.a = 222

puts t.a_history

