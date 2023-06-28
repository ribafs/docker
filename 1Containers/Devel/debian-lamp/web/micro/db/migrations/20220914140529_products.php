<?php
declare(strict_types=1);

use Phinx\Migration\AbstractMigration;

final class Products extends AbstractMigration
{
	// https://book.cakephp.org/phinx/0/en/migrations.html#the-change-method
    public function change(): void
    {
		$this->table('products')
		    ->addColumn('name', 'string', ['limit' => 50])
		    ->addColumn('price', 'integer')
		    ->create();
    }
}

