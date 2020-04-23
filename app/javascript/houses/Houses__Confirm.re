let str = React.string;

type state = {
  question1: bool,
  question2: bool,
  question3: bool,
  question4: bool,
  question5: bool,
  confirm: bool,
};

let buttonClasses = bool => {
  "btn btn-large border mr-2 "
  ++ (bool ? "bg-blue-500 text-white" : "bg-white");
};

let approved = state => {
  state.question1
  && state.question2
  && state.question3
  && state.question4
  && state.question5;
};

[@react.component]
let make = () => {
  let (state, setState) =
    React.useState(() =>
      {
        question1: false,
        question2: false,
        question3: false,
        question4: false,
        question5: false,
        confirm: false,
      }
    );

  <div className="container max-w-3xl mx-auto">
    <div className="">
      <div className="py-4 pl-3 pr-4 md:px-0">
        <div className="font-semibold text-xl ">
          {"Checklist for picking a house to stay" |> str}
        </div>
        <div className="text-sm ">
          {"You can pick any house in any district to stay but it should comply to the following details"
           |> str}
        </div>
      </div>
    </div>
    <div className="flex justify-between items-end py-4 pl-3 pr-4 md:px-0 ">
      <div className="flex flex-col">
        <div
          className="align-middle inline-block min-w-full shadow sm:rounded-lg border-b border-gray-200">
          <div className="min-w-full">
            <div className="bg-white">
              <div className=" flex flex-col md:flex-row justify-between">
                <div
                  className="w-full md: w-1/2  px-6 py-4  border-b border-gray-200 text-sm leading-5 font-medium text-gray-900">
                  {"I/We have a separate bath attached room for me/us." |> str}
                </div>
                <div
                  className="w-full md: w-1/2  px-6 py-4  border-b border-gray-200 text-sm leading-5 font-medium text-gray-900 text-right">
                  <button
                    className={buttonClasses(state.question1 == true)}
                    onClick={_ =>
                      setState(state => {...state, question1: true})
                    }>
                    {"Yes" |> str}
                  </button>
                  <button
                    className={buttonClasses(state.question1 == false)}
                    onClick={_ =>
                      setState(state => {...state, question1: false})
                    }>
                    {"No" |> str}
                  </button>
                </div>
              </div>
              <div className=" flex flex-col md:flex-row justify-between">
                <div
                  className="w-full md: w-1/2  px-6 py-4  border-b border-gray-200 text-sm leading-5 font-medium text-gray-900">
                  {"I don't have any member above 60 years in the place of stay."
                   |> str}
                </div>
                <div
                  className="w-full md: w-1/2  px-6 py-4  border-b border-gray-200 text-sm leading-5 font-medium text-gray-900 text-right">
                  <button
                    className={buttonClasses(state.question2 == true)}
                    onClick={_ =>
                      setState(state => {...state, question2: true})
                    }>
                    {"Yes" |> str}
                  </button>
                  <button
                    className={buttonClasses(state.question2 == false)}
                    onClick={_ =>
                      setState(state => {...state, question2: false})
                    }>
                    {"No" |> str}
                  </button>
                </div>
              </div>
              <div className=" flex flex-col md:flex-row justify-between">
                <div
                  className="w-full md: w-1/2  px-6 py-4  border-b border-gray-200 text-sm leading-5 font-medium text-gray-900">
                  {"I don't have any member suffering from" |> str}
                  <div className="pl-4"> {"1. Diabetes" |> str} </div>
                  <div className="pl-4">
                    {"2. Hypertension (High Blood Pressure)" |> str}
                  </div>
                  <div className="pl-4"> {"3. Cardiac Disease" |> str} </div>
                  <div className="pl-4"> {"4. Kidney Disease" |> str} </div>
                  <div className="pl-4"> {"5. Lung Disease" |> str} </div>
                  <div className="pl-4"> {"6. Liver Disease" |> str} </div>
                  <div className="pl-4"> {"7. Cancer" |> str} </div>
                </div>
                <div
                  className="w-full md: w-1/2  px-6 py-4  border-b border-gray-200 text-sm leading-5 font-medium text-gray-900 text-right">
                  <button
                    className={buttonClasses(state.question3 == true)}
                    onClick={_ =>
                      setState(state => {...state, question3: true})
                    }>
                    {"Yes" |> str}
                  </button>
                  <button
                    className={buttonClasses(state.question3 == false)}
                    onClick={_ =>
                      setState(state => {...state, question3: false})
                    }>
                    {"No" |> str}
                  </button>
                </div>
              </div>
              <div className=" flex flex-col md:flex-row justify-between">
                <div
                  className="w-full md: w-1/2  px-6 py-4  border-b border-gray-200 text-sm leading-5 font-medium text-gray-900">
                  {"I don't have any member who is on steroid therapy/ On Immunosuppressive Medicines ( post organ transplant/ auto-immune/etc)"
                   |> str}
                </div>
                <div
                  className="w-full md: w-1/2  px-6 py-4  border-b border-gray-200 text-sm leading-5 font-medium text-gray-900 text-right">
                  <button
                    className={buttonClasses(state.question4 == true)}
                    onClick={_ =>
                      setState(state => {...state, question4: true})
                    }>
                    {"Yes" |> str}
                  </button>
                  <button
                    className={buttonClasses(state.question4 == false)}
                    onClick={_ =>
                      setState(state => {...state, question4: false})
                    }>
                    {"No" |> str}
                  </button>
                </div>
              </div>
              <div className=" flex flex-col md:flex-row justify-between">
                <div
                  className="w-full md: w-1/2  px-6 py-4  border-b border-gray-200 text-sm leading-5 font-medium text-gray-900">
                  {"I don't have any member who is pregnant." |> str}
                </div>
                <div
                  className="w-full md: w-1/2  px-6 py-4  border-b border-gray-200 text-sm leading-5 font-medium text-gray-900 text-right">
                  <button
                    className={buttonClasses(state.question5 == true)}
                    onClick={_ =>
                      setState(state => {...state, question5: true})
                    }>
                    {"Yes" |> str}
                  </button>
                  <button
                    className={buttonClasses(state.question5 == false)}
                    onClick={_ =>
                      setState(state => {...state, question5: false})
                    }>
                    {"No" |> str}
                  </button>
                </div>
              </div>
            </div>
          </div>
          <div className="flex items-center justify-between pr-6">
            <div className="py-4 px-6 font-bold">
              {"I confirm that the details i entered above are right" |> str}
            </div>
            <button
              className={buttonClasses(state.confirm == true)}
              onClick={_ => setState(state => {...state, confirm: true})}>
              {"Yes" |> str}
            </button>
          </div>
          <div className="mt-4">
            {state.confirm
               ? <div className="mt-4 px-6 py-6 bg-green-300 font-bold">
                   {approved(state)
                      ? <div className="flex items-center justify-between">
                          <div> {"Your Application is Approved" |> str} </div>
                          <a
                            href="./new"
                            className="bg-white p-2 font-semibold ml-4 rounded shadow">
                            {"Add your house Details" |> str}
                          </a>
                        </div>
                      : <div>
                          {"To protect your family, We cannot let you travell to your place, Please book a room at STAY"
                           |> str}
                        </div>}
                 </div>
               : React.null}
          </div>
        </div>
      </div>
    </div>
  </div>;
};
