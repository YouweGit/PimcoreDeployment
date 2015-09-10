<html>
<head>
    <meta charset="UTF-8">
    <title>Youwe Deploy Migration Settings</title>
</head>
<body>

<form action="/plugin/YouweDeploy/admin/save-setting" method="POST" class="youwe-deploy-setting">
    <fieldset>
        <legend>Tables to copy:</legend>
        <div class="pure-control-group">
            <?php foreach ($this->tables as $name => $table):?>
                <?php if (preg_match('/object/', $name)) continue;?>
            <label>
                <input type="checkbox" name="tablesToCopy[<?php echo $name ?>]" value="1" <?php if(in_array($name, $this->tablesToCopy['table'])) echo 'checked';  ?>>
                <?php echo $name ?>
            </label>
            <?php endforeach;?>
        </div>

    </fieldset>
    <button type="submit">Save</button>
</form>
</body>
</html>