##### 一、创建数据库
1. `rake db:create`命令自动创建对应的开发和测试数据库<small>($ProjectName_development和$ProjectName_test)</small>。
2. `rails g model Aritcle title:string text:text`命令在db/migrate文件下生成类似<span>20170227122746_create_aritcles.rb名称的迁徙文件</span><small>(Article单词故意写错)</small>。

        class CreateAritcles < ActiveRecord::Migration[5.0]
          def change
            create_table :aritcles do |t|
              t.string :title
              t.text :text

              t.timestamps
            end
          end
        end

3. `rake db:migrate`命令执行上一命令生成的迁移文件数据库中将自动创建对应的aritcle数据表，并且此时db/schema.rb文件内容类似下面这样

        ActiveRecord::Schema.define(version: 20170227124949) do
          create_table "aritcles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
            t.string   "title"
            t.text     "text",       limit: 65535
            t.datetime "created_at",               null: false
            t.datetime "updated_at",               null: false
          end
        end

##### 二、修改数据表名

1. `rails g migration ChangeTableNameFromDevelopments`命令在db?migrate文件下创建类似<span>20170227132308_change_table_name_from_developments.rb</span>的迁移文件。
2. 修改上一命令生成的迁移文件成类似下面这样

        class ChangeTableNameFromDevelopments < ActiveRecord::Migration[5.0]
          def change
            rename_table :aritcles, :articles
          end
        end

3. `rake db:migrate`命令执行最新的迁移文件将自动修改数据库中的表名，此时db/schema.rb文件内容为：

        ActiveRecord::Schema.define(version: 20170227124949) do
          create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
            t.string   "title"
            t.text     "text",       limit: 65535
            t.datetime "created_at",               null: false
            t.datetime "updated_at",               null: false
          end
        end

##### 三、增加数据表字段

1. `rails g migration AddTestColumnToDevelopments`生成迁移文件
2. 修改迁移文件

        class AddTestColumnToDevelopments < ActiveRecord::Migration[5.0]
          def change
            add_column :articles, :test_column, :string
          end
        end

3. 执行`rake db:migrate`命令执行迁移，此时db/schema.rb文件内容为

        ActiveRecord::Schema.define(version: 20170227133559) do
          create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
            t.string   "title"
            t.text     "text",        limit: 65535
            t.datetime "created_at",                null: false
            t.datetime "updated_at",                null: false
            t.string   "test_column"
          end
        end

##### 四、约定大于配置
1. 迁移文件rails按照时间先后执行并且实施更新db/schema.rb文件以显示最新的数据结构。
2. change是迁移中最常用的方法

    > add_column
    > add_index
    > add_reference
    > add_timestamps
    > create_table
    > create_join_table
    > drop_table(必须提供代码块)
    > drop_join_table(必须提供代码块)
    > remove_timestamps
    > remove_column
    > rename_column
    > rename_index
    > rename_table


<strong>谨以此文记录自己一次手误导致数据表名错误加以修改的过程</strong>
