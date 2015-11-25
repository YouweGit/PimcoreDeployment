<html>
<head>
    <meta charset="UTF-8">
    <title>Deployment Settings</title>
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
        th {
            font-size: 10px;
        }
        td {
            font-size: 12px;
            text-align: center;
        }
        .docc {
            text-align: left;
        }
        .radiodoc {
            min-width: 70px;
        }
    </style>
</head>
<body>

<form action="/plugin/Deployment/admin/save-setting" method="POST" class="youwe-deploy-setting">
    <fieldset>
        <legend>Static table data to copy (overwriting everything)</legend>
            <?php foreach ($this->tables as $name => $table):?>
                <?php if (preg_match('/object|migration_tables/', $name)) continue;?>
            <label>
                <?php $checked = (is_array(@$this->staticDataTables['table']) && in_array($name, $this->staticDataTables['table'])) ? 'checked' : ($name == @$this->staticDataTables['table'] ? 'checked' : '');?>
                <input type="checkbox" name="staticDataTables[table][]" value="<?php print $name ?>" value="1" <?php print $checked;  ?>>
                <?php print $name ?>
            </label>
            <?php endforeach;?>
    </fieldset>
    <button type="submit" name="save" value="1">Save</button>
</form>

<form action="/plugin/Deployment/admin/save-keys" method="POST" class="youwe-deploy-setting">
    <fieldset>
        <legend>Documents to migrate</legend>
            <table>
                <tr>
                    <th class="docc">
                        Document
                    </th>
                    <th>
                        Default
                    </th>
                    <th>
                        Inherit
                    </th>
                    <th>
                        Insert if not exists
                    </th>
                    <th>
                        Supplement
                    </th>
                    <th>
                        Force replace
                    </th>
                    <th>
                        Migration key
                    </th>
                </tr>
                <?php foreach ($this->docs as &$doc):?>
                <tr>
                    <td class="docc">
                        <?php echo $doc['id'] . ' ' . $doc['path'] . '' . $doc['key']; ?>
                    </td>
                    <td class="radiodoc">
                        <input type="radio" name="doc[<?php print $doc['id'] ?>]" value="default" <?php if($doc['migration_mode'] == 'default'): ?>checked="checked"<?php endif ?>>
                    </td>
                    <td class="radiodoc">
                        <input type="radio" name="doc[<?php print $doc['id'] ?>]" value="inherit" <?php if($doc['migration_mode'] == 'inherit'): ?>checked="checked"<?php endif ?>>
                    </td>
                    <td class="radiodoc">
                        <input type="radio" name="doc[<?php print $doc['id'] ?>]" value="softinsert" <?php if($doc['migration_mode'] == 'softinsert'): ?>checked="checked"<?php endif ?>>
                    </td>
                    <td class="radiodoc">
                        <input type="radio" name="doc[<?php print $doc['id'] ?>]" value="supplement" <?php if($doc['migration_mode'] == 'supplement'): ?>checked="checked"<?php endif ?>>
                    </td>
                    <td class="radiodoc">
                        <input type="radio" name="doc[<?php print $doc['id'] ?>]" value="force" <?php if($doc['migration_mode'] == 'force'): ?>checked="checked"<?php endif ?>>
                    </td>
                    <td class="radiodoc">
                        <?php echo $doc['migration_key']; ?>
                    </td>
                </tr>
                <?php endforeach;?>
            </table>
    </fieldset>
    <button type="submit" name="save" value="1">Save</button>
</form>


</body>
</html>