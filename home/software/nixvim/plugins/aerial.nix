# aerial
{
  enable = true;
  settings = {
    default_direction = "prefer_right";
    open_automatic = true;
    placement = "edge";
    show_guides = true;
    layout = {
      max_width = 36;
      min_width = 36;
    };
    filter_kind = [
      "Class" "Constructor" "Enum" "Function" "Interface" "Module"
      "Method" "Namespace" "Struct"
    ];
  };
}

