$.ajax({
  url: "/versions",
  success: function(data) {
    if($('#version-badge').length) {
      if(versionCompare(data.current_version, data.latest_version) < 0) {
        $('#version-badge').text('')
        $('#version-badge').append('<p class=\"bg-danger\">Version ' + data.current_version + ' is out of date!</p>')
        $('#version-badge').append('<p> Latest Version: ' + data.latest_version + '</p>')
        //$('#version-badge').append('<a class=\"btn btn-default\" href=\"' + data.update_instructions_link + '\">Update</a>')
      } else {
        $('#version-badge').text('')
        $('#version-badge').append('<p class=\"bg-success\">Version ' + data.current_version + ' is up to date.</p>')
        $('#version-badge').append('<p> Latest Version: ' + data.latest_version + '</p>')
      }
    }
  }
});

function versionCompare(v1, v2, options) {
    var lexicographical = options && options.lexicographical,
        zeroExtend = options && options.zeroExtend,
        v1parts = v1.split('.'),
        v2parts = v2.split('.');

    function isValidPart(x) {
        return (lexicographical ? /^\d+[A-Za-z]*$/ : /^\d+$/).test(x);
    }

    if (!v1parts.every(isValidPart) || !v2parts.every(isValidPart)) {
        return NaN;
    }

    if (zeroExtend) {
        while (v1parts.length < v2parts.length) v1parts.push("0");
        while (v2parts.length < v1parts.length) v2parts.push("0");
    }

    if (!lexicographical) {
        v1parts = v1parts.map(Number);
        v2parts = v2parts.map(Number);
    }

    for (var i = 0; i < v1parts.length; ++i) {
        if (v2parts.length == i) {
            return 1;
        }

        if (v1parts[i] == v2parts[i]) {
            continue;
        }
        else if (v1parts[i] > v2parts[i]) {
            return 1;
        }
        else {
            return -1;
        }
    }

    if (v1parts.length != v2parts.length) {
        return -1;
    }

    return 0;
}
