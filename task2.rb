# Клас ShoppingCart для управління товарами в кошику
class ShoppingCart
    def initialize
      @items = []  # Масив для зберігання товарів
    end
  
    # Метод для додавання товару до кошика
    def add_item(name, price, quantity = 1)
      item = { name: name, price: price, quantity: quantity }
      @items << item
      puts "Додано #{quantity} шт. товару '#{name}' до кошика."
    end
  
    # Метод для обчислення загальної вартості товарів у кошику
    def total_price
      total = @items.reduce(0) do |sum, item|
        sum + item[:price] * item[:quantity]
      end
      total
    end
  
    # Метод для виведення всіх товарів у кошику
    def show_items
      puts "Товари у вашому кошику:"
      @items.each do |item|
        puts "Товар: #{item[:name]}, Ціна: #{item[:price]} грн, Кількість: #{item[:quantity]}"
      end
    end
  end
  
  # Основна програма
  def display_products(products)
    puts "Ось список доступних товарів:"
    products.each_with_index do |(name, price), index|
      puts "#{index + 1}. #{name} - #{price} грн"
    end
  end
  
  def select_products(cart, products)
    loop do
      display_products(products)
      puts "Виберіть номер товару для додавання до кошика або 0 для завершення покупок:"
      choice = gets.chomp.to_i
  
      if choice == 0
        break
      elsif choice.between?(1, products.size)
        selected_product = products.keys[choice - 1]
        selected_price = products[selected_product]
        puts "Скільки одиниць товару '#{selected_product}' ви хочете додати?"
        quantity = gets.chomp.to_i
        cart.add_item(selected_product, selected_price, quantity)
      else
        puts "Неправильний вибір, спробуйте ще раз."
      end
    end
  end
  
  # Попередньо визначений список товарів
  available_products = {
    "Яблуко" => 10,
    "Молоко" => 25,
    "Хліб" => 15,
    "Сир" => 50,
    "Шоколад" => 30
  }
  
  cart = ShoppingCart.new
  
  # Вибір користувачем товарів
  select_products(cart, available_products)
  
  # Виведення всіх товарів у кошику
  cart.show_items
  
  # Обчислення та виведення загальної вартості
  puts "Загальна вартість товарів у кошику: #{cart.total_price} грн"
  