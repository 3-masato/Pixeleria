module Seeds
  # コンソールの出力結果に色を付けるためのクラスです
  class Chalk

    # 緑色のテキストを出力します
    # 主に情報レベルのメッセージに使用します
    def self.info(text)
      print "\e[32m"
      puts "Seeds: #{text}"
      print "\e[0m"
    end

    # 黄色のテキストを出力します
    # 主に警告レベルのメッセージに使用します
    def self.warn(text)
      print "\e[33m"
      puts "Seeds: #{text}"
      print "\e[0m"
    end
  end
end