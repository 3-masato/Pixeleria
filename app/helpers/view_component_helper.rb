module ViewComponentHelper
  # 指定されたコンポーネント名を元にViewComponentをレンダリングするメソッド。
  # コンポーネント名は、スネークケースのシンボルまたは文字列で与えられ、
  # 指定されたコンポーネントが存在しない場合は `NameError` が発生する。
  #
  # @param name [Symbol, String] レンダリングするコンポーネントの名前。
  # @param args [Array] コンポーネントのコンストラクタに渡される引数。
  # @param kwargs [Hash] コンポーネントのコンストラクタに渡されるキーワード引数。
  # @yield ブロックが与えられた場合、コンポーネントの内容として評価される。
  # @return [String] レンダリングされたHTMLコンテンツ。
  def component(name, *args, **kwargs, &block)
    component_class_name = name.to_s.camelize
    component_class = "#{component_class_name}Component".safe_constantize

    raise NameError, "Undefined components: #{component_class_name}" unless component_class

    render component_class.new(*args, **kwargs), &block
  end
end