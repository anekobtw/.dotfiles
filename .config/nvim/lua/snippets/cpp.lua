local ls = require("luasnip")

ls.add_snippets("cpp", {
  ls.snippet("cf", {
    ls.text_node({
      "#include <bits/stdc++.h>",
      "using namespace std;",
      "",
      "using vi = vector<int>;",
      "",
      "void solve() {",
      "    ",
    }),
    ls.insert_node(1),
    ls.text_node({
      "",
      "}",
      "",
      "int main() {",
      "    ios::sync_with_stdio(false);",
      "    cin.tie(nullptr);",
      "",
      "    int t = 1;",
      "    cin >> t;",
      "    while (t--) solve();",
      "",
      "    return 0;",
      "}",
    }),
  }),
})
