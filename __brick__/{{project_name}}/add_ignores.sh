#!/bin/bash
# Script to add ignore_for_file directive to all Dart files with template imports

cd /Users/guvanch/.gemini/antigravity/scratch/bricks/flutter_project_template/__brick__/{{project_name}}

# Find all .dart files that contain package:{{project_name}}/
find lib -name "*.dart" -type f -exec grep -l "package:{{project_name}}/" {} \; | while read file; do
  # Check if file already has ignore_for_file directive
  if ! head -1 "$file" | grep -q "^// ignore_for_file:"; then
    # Add comprehensive ignore directive at the top
    echo "// ignore_for_file: uri_does_not_exist, undefined_class, undefined_identifier, not_a_type, undefined_method, undefined_annotation_member, invalid_annotation_target, uri_has_not_been_generated, unused_element
" | cat - "$file" > temp && mv temp "$file"
    echo "Added ignore directive to: $file"
  else
    echo "Already has ignore directive: $file"
  fi
done

echo "Done!"
