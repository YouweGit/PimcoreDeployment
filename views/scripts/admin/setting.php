<html>
<head>
    <meta charset="UTF-8">
    <title>Youwe Deploy Migration Settings</title>
    <style>
        .youwe-deploy-setting {
            font: normal 11px/13px arial, tahoma, helvetica, sans-serif;
        }
        .youwe-deploy-setting fieldset {
            margin-bottom: 10px;
            border: 1px solid #ccc;
        }
        .youwe-deploy-setting label {
            display: inline-block;
            margin: 5px;
            border: 1px solid #eee;
            padding: 5px;
            box-shadow: 1px 1px 1px #ddd;
        }
        .youwe-deploy-setting button {
            padding: 5px;
            cursor: pointer;
        }
        .youwe-deploy-setting input {
            padding: 3px 5px;
            margin: 0 5px;
        }
    </style>
</head>
<body>

<form action="/plugin/YouweDeploy/admin/save-setting" method="POST" class="youwe-deploy-setting">
    <?php //print_r($this->admin)?>
    <fieldset>
        <legend>Admin user</legend>
        <label>Username <input type="text" name="admin[username]" value="<?php print $this->admin['username']?>"></label>
        <label>Password<input type="password" name="admin[password]" value="<?php print $this->admin['password']?>"></label>
        <label>Email<input type="text" name="admin[email]" value="<?php print $this->admin['email']?>"></label>
    </fieldset>

    <fieldset>
        <legend>Data to copy</legend>
            <?php foreach ($this->tables as $name => $table):?>
                <?php if (preg_match('/object|migration_tables/', $name)) continue;?>
            <label>
                <?php $checked = (is_array($this->tablesToCopy['table']) && in_array($name, $this->tablesToCopy['table'])) ? 'checked' : ($name == $this->tablesToCopy['table'] ? 'checked' : '');?>
                <input type="checkbox" name="tablesToCopy[table][]" value="<?php print $name ?>" value="1" <?php print $checked;  ?>>
                <?php print $name ?>
            </label>
            <?php endforeach;?>
    </fieldset>
    <button type="submit" name="save" value="1">Save</button>
</form>
</body>
</html>