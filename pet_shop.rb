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