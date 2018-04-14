def pet_shop_name(shop)
  return shop[:name]
end

def total_cash(shop)
  return shop[:admin][:total_cash]
end

def add_or_remove_cash(shop, amount)
  shop[:admin][:total_cash] += amount
end

def pets_sold(shop)
  return shop[:admin][:pets_sold]
end

def increase_pets_sold(shop, number_of_pets)
  shop[:admin][:pets_sold] += number_of_pets
end

def stock_count(shop)
  return shop[:pets].length()
end

def pets_by_breed(shop, breed)
  pets_of_breed = []
  for pet in shop[:pets]
    pets_of_breed.push(pet) if pet[:breed] == breed
  end

  return pets_of_breed
end

def find_pet_by_name(shop, pet_name)
  for pet in shop[:pets]
    return pet if pet[:name] == pet_name
  end

  return nil
end

def remove_pet_by_name(shop, pet_name)
  for pet in shop[:pets]
    shop[:pets].delete(pet) if pet[:name] == pet_name
  end
end

def add_pet_to_stock(shop, new_pet)
  shop[:pets].push(new_pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
  return customer[:pets].length()
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, pet)
  return customer[:cash] >= pet[:price]
end

def sell_pet_to_customer(shop, pet, customer)
  if customer_can_afford_pet(customer, pet)
    pet_cost = pet[:price]
    pet_name = pet[:name]
    remove_customer_cash(customer, pet_cost)
    add_or_remove_cash(shop, pet_cost)
    # remove_pet_by_name(shop, pet_name)
    add_pet_to_customer(customer, pet)
    increase_pets_sold(shop, 1)
  end
end