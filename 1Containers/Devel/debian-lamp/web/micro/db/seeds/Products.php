<?php
use Phinx\Seed\AbstractSeed;

class Products extends AbstractSeed
{
    /**
     * Run Method.
     *
     * Write your database seeder using this method.
     *
     * More information on writing seeders is available here:
     * https://book.cakephp.org/phinx/0/en/seeding.html
     */
    public function run()
    {
        $faker = Faker\Factory::create();
        $data = [];
        for ($i = 0; $i < 50; $i++) {
            $data[] = [
                'name'      => $faker->userName,
                'price'     => $faker->numberBetween($min = 5, $max = 50)
            ];
        }
        $this->insert('products', $data);
    }
}

