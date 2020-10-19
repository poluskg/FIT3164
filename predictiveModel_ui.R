basicModel = div(
  column(4,
    div(sliderInput(inputId="userAge", label="Select Age", min=30, max=100, value=50, step=1)),
    div(numericInput(inputId="userWeight", label="Enter Weight (Kg)", value=35, min=35, max=400, step=1)),
    div(numericInput("userHeight", label="Enter Height (cm)", value=100, min=100, max=250, step=1))
  ),
  column(4,
    div(userWeight),
    div(userBP),
    div(userPR)
  ),
  column(4,
    div(smoker)
  )
)

advancedModel = div(
  column(4,
    div(userAge),
    div(userSex),
    div(userHeight),
    div(thyroidDisease),
    div(edema),
    div(weakPeripheralPulse)
  ),
  column(4,
     div(userWeight),
     div(userBP),
     div(userPR),
     div(systolicMurmur),
     div(diastolicMurmur),
     div(chestPainType)
  ),
  column(4,
     div(smoker),
     div(airwayDisease),
     div(atypical),
     div(nonanginal)
  )
)
