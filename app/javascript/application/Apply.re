let str = React.string;

[@react.component]
let make = () => {
  <div className="container mx-auto px-3 max-w-5xl py-8">
    <div
      className="border border-gray-100 rounded-lg shadow-lg bg-white p-3 md:p-6 ">
      <div className="text-3xl font-semibold">
        {"Create Application" |> str}
      </div>
      <form>
        <div className="mt-4">
          <label
            htmlFor="email"
            className="block text-sm font-medium leading-5 text-gray-700">
            {"Email" |> str}
          </label>
          <div
            className="inline-block tracking-wide text-xs font-semibold mb-2 leading-tight">
            <input
              id="email"
              className="appearance-none block w-full bg-white border border-gray-400 rounded py-3 px-4 leading-snug focus:outline-none focus:bg-white focus:border-gray-500"
              placeholder="you@example.com"
            />
          </div>
          <p className="mt-2 text-sm text-gray-500">
            {"Make your password short and easy to guess." |> str}
          </p>
        </div>
      </form>
    </div>
  </div>;
};
