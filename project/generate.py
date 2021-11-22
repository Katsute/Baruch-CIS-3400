import csv
import random

import faker

fake: faker.proxy.Faker = faker.Faker()

# store

stores: int = 5

with open("store.csv", 'w', newline='') as file:
    OUT: csv.writer = csv.writer(file)

    index: int = 0
    for _ in range(1, stores + 1):
        index += 1

        OUT.writerow([
            index,
            fake.street_address(),
            fake.city(),
            fake.address().split(' ')[-2],
            fake.address().split(' ')[-1],
            "United States"
        ])

# dept

departments: int = 6

with open("department.csv", 'w', newline='') as file:
    OUT: csv.writer = csv.writer(file)

    index: int = 0
    for s_index in range(1, stores + 1):
        for _ in range(1, departments + 1):
            index += 1

            OUT.writerow([
                index,
                fake.word(),
                f"{random.choice(['Front', 'Back', 'Center'])} {random.choice(['Left', 'Back', 'Center'])}",
                s_index
            ])

# employee

employees: int = 5

with open("employee.csv", 'w', newline='') as file:
    OUT: csv.writer = csv.writer(file)

    index: int = 0
    d_index: int = 0
    for s_index in range(1, stores + 1):
        for d in range(departments):
            d_index += 1
            for _ in range(employees):
                index += 1

                male: bool = bool(random.getrandbits(1))
                name: str = fake.name_male() if male else fake.name_female()

                address: str = fake.address()

                OUT.writerow([
                    index,
                    name.split(' ')[0],
                    name.split(' ')[1],
                    fake.street_address(),
                    fake.building_number() if bool(random.getrandbits(1)) else None,
                    fake.city(),
                    fake.address().split(' ')[-2],
                    fake.address().split(' ')[-1],
                    "United States",
                    "Male" if male else "Female",
                    int(f"{random.randint(700,999)}{random.randint(0,9)}{random.randint(0,9)}{random.randint(0,9)}{random.randint(0,9)}{random.randint(0,9)}{random.randint(0,9)}{random.randint(0,9)}"),
                    s_index,
                    d_index
                ])

# schedule

schedule: int = 2

with open("schedule.csv", 'w', newline='') as file:
    OUT: csv.writer = csv.writer(file)

    d_index: int = 0
    e_index: int = 0
    for s_index in range(1, stores + 1):
        for _ in range(departments):
            d_index += 1
            for _ in range(employees):
                e_index += 1

                OUT.writerow([
                    e_index,
                    fake.day_of_week(),
                    f"{random.randint(1, 12)} {fake.am_pm()}",
                    f"{random.randint(1, 12)} {fake.am_pm()}",
                    e_index
                ])

# product

products: int = 10

with open("product.csv", 'w', newline='') as file:
    OUT: csv.writer = csv.writer(file)

    index: int = 0
    d_index: int = 0
    for s_index in range(1, stores + 1):
        for _ in range(departments):
            d_index += 1
            for _ in range(products):
                index += 1

                max_qty: int = random.randint(1, 100)
                cost: float = float(f"{random.randint(1, 200)}.{random.randint(0, 99)}")

                OUT.writerow([
                    index,
                    fake.word(),
                    cost,
                    float(f"{random.randint(int(cost), int(cost) * 2)}.{random.randint(0, 99)}"),
                    random.randint(0, max_qty),
                    max_qty,
                    d_index
                ])

# sale

sales: int = 10

with open("sale.csv", 'w', newline='') as file:
    OUT: csv.writer = csv.writer(file)

    index: int = 0
    d_index: int = 0
    e_index: int = 0
    for s_index in range(1, stores + 1):
        for _ in range(departments):
            d_index += 1
            for _ in range(employees):
                e_index += 1
                for _ in range(sales):
                    index += 1

                    OUT.writerow([
                        index,
                        fake.date_time_this_decade().strftime("%m/%d/%Y, %H:%M:%S"),
                        random.choice(["Credit", "Debit", "Cash"]),
                        e_index,
                        s_index
                    ])

# product order

orders: int = 4

with open("order.csv", 'w', newline='') as file:
    OUT: csv.writer = csv.writer(file)

    index: int = 0
    d_index: int = 0
    e_index: int = 0
    sl_index: int = 0
    for s_index in range(1, stores + 1):
        for _ in range(departments):
            d_index += 1
            for _ in range(employees):
                e_index += 1
                for _ in range(sales):
                    sl_index += 1
                    for _ in range(orders):
                        index += 1

                        qty: int = random.randint(1, 10)

                        OUT.writerow([
                            index,
                            qty,
                            round(float(f"{random.randint(1, 200)}.{random.randint(0, 99)}") * qty, 2),
                            random.randint(((d_index - 1) * departments) + 1, ((d_index - 1) * departments) + products),
                            sl_index
                        ])
