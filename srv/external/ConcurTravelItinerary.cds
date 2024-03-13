/* checksum : d04299a0424288a8f26dbf8ec46899e8 */
@Capabilities.BatchSupported : false
@Capabilities.KeyAsSegmentSupported : true
@Core.Description : 'Itinerary API'
@Core.SchemaVersion : 'v4'
@Core.LongDescription : ```
This is the api specification for the Itinerary API.

Introduction
The Itinerary API provides clients and authorized partners access to travel itinerary data. They can now subscribe to events and fetch trips by ID.

```
service Itinerary.API {};

@Common.Label : 'trip'
@Core.Description : 'v4 - Get Trip Ids by Company'
@Core.LongDescription : 'Gets the upcoming trips for the given company. Company JWT is required as part of the authorization.'
@openapi.path : '/trips'
function Itinerary.API.trips(
  @description : 'Output schema type. Supported value is id'
  @openapi.in : 'query'
  schema : String,
  @description : 'start date for the query list | format - `2023-01-02`. Date cannot be older than 6 months from now'
  @openapi.in : 'query'
  endDateFrom : String,
  @description : 'end date for the query list, results include this date | format - `2023-01-02`'
  @openapi.in : 'query'
  endDateTo : String,
  @description : 'Get results after a specific start Id'
  @openapi.in : 'query'
  startAfter : String
) returns Itinerary.API_types.model_ItineraryIdListResponse;

@Common.Label : 'trip'
@Core.Description : 'v4 - Get Trip record'
@Core.LongDescription : 'Gets the trip record'
@openapi.path : '/trips/{tripID}'
function Itinerary.API.trips_(
  @description : 'trip id'
  @openapi.in : 'path'
  tripID : UUID
) returns Itinerary.API_types.Itinerary;

type Itinerary.API_types.AccountingLine {
  AirlineCode : String;
  AmountPaid : String;
  AmountPaidCurrency : String;
  CCNumber : String;
  Comment : String;
  Commission : String;
  CommissionCurrency : String;
  ExchangedTicketNumber : String;
  FOPMethod : String;
  Fare : String;
  FareCurrency : String;
  IssueDate : String;
  MCOType : String;
  Tax : String;
  TaxCurrency : String;
  TranControlNbr : String;
  TranPlatingNbr : String;
};

type Itinerary.API_types.Air {
  AircraftCode : String;
  Bags : String;
  Cabin : String;
  CancellationNumber : String;
  CancellationPolicy : String;
  CarbonEmissionLbs : Decimal;
  CarbonModel : Integer;
  Charges : Itinerary.API_types.ChargeDetail;
  CheckedBaggage : String;
  ClassOfService : String;
  ConfirmationNumber : String;
  DateCancelledUtc : String;
  DateCreatedUtc : String;
  DateModifiedUtc : String;
  Duration : Integer;
  ETicket : String;
  EndCityCode : String;
  EndDateLocal : String;
  EndDateUtc : String;
  EndGate : String;
  EndTerminal : String;
  FlightNumber : String;
  FrequentTravelerId : String;
  IsOpenSegment : Boolean;
  IsPreferredVendor : Integer;
  IsUpgradeAllowed : Boolean;
  LegId : Integer;
  Meals : String;
  Miles : Integer;
  Notes : String;
  NumStops : Integer;
  OpenSegment : String;
  OperatedByFlightNumber : String;
  OperatedByVendor : String;
  OperatedByVendorName : String;
  Remarks : Itinerary.API_types.Remarks;
  RuleViolations : many Itinerary.API_types.RuleViolation;
  Seats : many Itinerary.API_types.AirSeat;
  Services : String;
  SpecialInstructions : String;
  StartCityCode : String;
  StartDateLocal : String;
  StartDateUtc : String;
  StartGate : String;
  StartTerminal : String;
  Status : String;
  TimeZone : String;
  TimeZoneId : Integer;
  UpgradedDateTime : String;
  Vendor : String;
  VendorFlags : String;
  VendorName : String;
};

type Itinerary.API_types.AirSeat {
  PassengerRph : Integer;
  SeatNumber : String;
  Status : String;
};

type Itinerary.API_types.AirlineAdjustment {
  AddCollectAmount : Decimal;
  AdjustmentDateTime : String;
  AdjustmentDateTimeUTC : String;
  AdjustmentType : String;
  AirlineCharges : Itinerary.API_types.ChargeDetail;
  DateCreatedUtc : String;
  DateModifiedUtc : String;
  PassengerName : String;
  PlatingCarrierNumericCode : String;
  PlatingControlNumber : String;
  RecordLocator : String;
  Taxes : many Itinerary.API_types.Tax;
  TotalAdjustment : Decimal;
  TotalAdjustmentCurrency : String;
};

type Itinerary.API_types.AirlineTicket {
  AccountingLine : Itinerary.API_types.AccountingLine;
  AddCollectAmount : Decimal;
  AirlineCharges : Itinerary.API_types.ChargeDetail;
  AirlineTicketCoupons : many Itinerary.API_types.AirlineTicketCoupon;
  AirlineTicketExchanges : many Itinerary.API_types.AirlineTicketExchange;
  AirlineTicketFareBreakups : many Itinerary.API_types.AirlineTicketFareBreakup;
  BaseFare : Decimal;
  BaseFareCurrency : String;
  BaseFareNuc : Decimal;
  BaseFareNucCurrency : String;
  ComparisonFare : Decimal;
  ComparisonFareCurrency : String;
  DateCreatedUtc : String;
  DateModifiedUtc : String;
  Endorsements : String;
  InvoiceNumber : String;
  IssueDateTime : String;
  IssueDateTimeUTC : String;
  IssuingIataAgencyNumber : Integer;
  IssuingPseudoCity : String;
  LinearFareConstructor : String;
  MasterTicketNumber : String;
  NameReference : String;
  PassengerName : String;
  PlatingCarrierNumericCode : String;
  PlatingControlNumber : String;
  ProgramCarrierCode : String;
  ProgramMembershipNumber : String;
  RecordLocator : String;
  SabreDkNumber : String;
  Taxes : many Itinerary.API_types.Tax;
  TicketType : String;
  Ticketless : Boolean;
  TotalFare : Decimal;
  TotalFareCurrency : String;
  TourIdentifier : String;
};

type Itinerary.API_types.AirlineTicketCoupon {
  ClassOfService : String;
  CouponNumber : Integer;
  CouponStatus : String;
  EndCityCode : String;
  FlightNumber : String;
  NotValidAfterDate : String;
  NotValidBeforeDate : String;
  RateCode : String;
  StartCityCode : String;
  StartDateLocal : String;
  Status : String;
  TicketDesignator : String;
  Vendor : String;
};

type Itinerary.API_types.AirlineTicketExchange {
  Amount : Decimal;
  AppliedSegment1 : Integer;
  AppliedSegment10 : Integer;
  AppliedSegment2 : Integer;
  AppliedSegment3 : Integer;
  AppliedSegment4 : Integer;
  AppliedSegment5 : Integer;
  AppliedSegment6 : Integer;
  AppliedSegment7 : Integer;
  AppliedSegment8 : Integer;
  AppliedSegment9 : Integer;
  Currency : String;
  DateModifiedUtc : String;
  OldRecordLocator : String;
  PlatingCarrierNumericCode : String;
  PlatingControlNumber : String;
};

type Itinerary.API_types.AirlineTicketFareBreakup {
  BaseFare : Decimal;
  ClassOfService : String;
  Currency : String;
  EndCityCode : String;
  IsRefundable : Boolean;
  StartCityCode : String;
  TotalFare : Decimal;
  Vendor : String;
};

type Itinerary.API_types.BaseAirlineTicket {
  AirlineAdjustment : many Itinerary.API_types.AirlineAdjustment;
  AirlineTicket : many Itinerary.API_types.AirlineTicket;
  ManualAirlineTicket : many Itinerary.API_types.ManualAirlineTicket;
};

type Itinerary.API_types.BaseRailPayment {
  RailAdjustment : many Itinerary.API_types.RailAdjustment;
  RailPayment : many Itinerary.API_types.RailPayment;
};

type Itinerary.API_types.Booking {
  AgencyName : String;
  AgencyPCC : String;
  AirfareQuotes : many Itinerary.API_types.Quote;
  AirlineTickets : Itinerary.API_types.BaseAirlineTicket;
  BookingOwner : String;
  BookingSource : String;
  Charges : Itinerary.API_types.ChargeDetail;
  DateBookedLocal : String;
  DateCreatedUtc : String;
  DateModifiedUtc : String;
  Delivery : Itinerary.API_types.Delivery;
  FormOfPaymentName : String;
  FormOfPaymentType : String;
  IsGhostCard : Boolean;
  ItinSourceName : String;
  LastTicketDateUtc : String;
  MiscChargeOrders : many Itinerary.API_types.MiscellaneousChargeOrder;
  PassPrograms : many Itinerary.API_types.PassProgram;
  Passengers : many Itinerary.API_types.Passenger;
  PhoneNumbers : many Itinerary.API_types.PhoneNumberData;
  RailPayments : Itinerary.API_types.BaseRailPayment;
  RecordLocator : String;
  Remarks : Itinerary.API_types.Remarks;
  Segments : Itinerary.API_types.Segment;
  TicketMailingAddress : String;
  TicketPickupLocation : String;
  TicketPickupNumber : String;
  WaitListSegments : Itinerary.API_types.WaitListSegments;
  Warnings : many Itinerary.API_types.Warning;
  WebAddresses : many Itinerary.API_types.WebAddressData;
};

type Itinerary.API_types.Car {
  AirCondition : String;
  Body : String;
  CancellationNumber : String;
  Charges : Itinerary.API_types.ChargeDetail;
  Class : String;
  ConfirmationNumber : String;
  Currency : String;
  DailyRate : Decimal;
  DateCancelledUtc : String;
  DateCreatedUtc : String;
  DateModifiedUtc : String;
  DiscountCode : String;
  DropoffCollectionAddress1 : String;
  DropoffCollectionAddressType : String;
  DropoffCollectionCategory : String;
  DropoffCollectionCity : String;
  DropoffCollectionCityCode : String;
  DropoffCollectionCountry : String;
  DropoffCollectionLatitude : String;
  DropoffCollectionLongitude : String;
  DropoffCollectionNumber : String;
  DropoffCollectionPhoneNumber : String;
  DropoffCollectionPostalCode : String;
  DropoffCollectionState : String;
  EndAddress : String;
  EndAddress2 : String;
  EndCity : String;
  EndCityCode : String;
  EndCloseTime : String;
  EndCountry : String;
  EndDateLocal : String;
  EndDateUtc : String;
  EndLatitude : Decimal;
  EndLongitude : Decimal;
  EndOpenTime : String;
  EndPhoneNumber : String;
  EndPostalCode : String;
  EndState : String;
  IsGhostCard : Boolean;
  IsPreferredVendor : Integer;
  IsUpgradeAllowed : Boolean;
  Notes : String;
  NumCars : Integer;
  NumPersons : Integer;
  PhoneNumber : String;
  PickupDeliveryAddress1 : String;
  PickupDeliveryAddressType : String;
  PickupDeliveryCategory : String;
  PickupDeliveryCity : String;
  PickupDeliveryCityCode : String;
  PickupDeliveryCountry : String;
  PickupDeliveryLatitude : String;
  PickupDeliveryLongitude : String;
  PickupDeliveryNumber : String;
  PickupDeliveryPhoneNumber : String;
  PickupDeliveryPostalCode : String;
  PickupDeliveryState : String;
  RateCode : String;
  RateType : String;
  Remarks : Itinerary.API_types.Remarks;
  SpecialEquipment : String;
  SpecialInstructions : String;
  StartAddress : String;
  StartAddress2 : String;
  StartCity : String;
  StartCityCode : String;
  StartCloseTime : String;
  StartCountry : String;
  StartDateLocal : String;
  StartDateUtc : String;
  StartLatitude : Decimal;
  StartLocation : String;
  StartLongitude : Decimal;
  StartOpenTime : String;
  StartPostalCode : String;
  StartState : String;
  Status : String;
  TimeZone : String;
  TimeZoneId : Integer;
  TotalRate : Decimal;
  Transmission : String;
  UpgradedDateTime : String;
  Vendor : String;
  VendorFlags : String;
  VendorName : String;
};

type Itinerary.API_types.ChargeDetail {
  Fixed : many Itinerary.API_types.Fixed;
  Percent : many Itinerary.API_types.Percent;
  Rate : many Itinerary.API_types.Rate;
  RateWithAllowance : many Itinerary.API_types.RateWithAllowance;
};

type Itinerary.API_types.CustomAttribute {
  Data : String;
  DataType : String;
  DisplayOnItinerary : Boolean;
  DisplayTitle : String;
  ExternalId : Integer;
  Name : String;
};

type Itinerary.API_types.Delivery {
  AddressLine1 : String;
  AddressLine2 : String;
  City : String;
  Country : String;
  Email : String;
  Latitude : Decimal;
  LocationAdditionalDetails : String;
  LocationDesc : String;
  LocationName : String;
  Longitude : Decimal;
  PhoneNumber : String;
  ReferenceNumber : String;
  State : String;
  Type : String;
  Zip : String;
};

type Itinerary.API_types.Dining {
  CancellationNumber : String;
  Charges : Itinerary.API_types.ChargeDetail;
  ConfirmationNumber : String;
  DateCancelledUtc : String;
  DateCreatedUtc : String;
  DateModifiedUtc : String;
  EndDateLocal : String;
  EndDateUtc : String;
  FrequentTravelerId : String;
  IsPreferredVendor : Integer;
  IsUpgradeAllowed : Boolean;
  Name : String;
  Notes : String;
  NumPersons : Integer;
  PhoneNumber : String;
  Remarks : Itinerary.API_types.Remarks;
  ReservationId : String;
  StartAddress : String;
  StartAddress2 : String;
  StartCity : String;
  StartCountry : String;
  StartDateLocal : String;
  StartDateUtc : String;
  StartLatitude : Decimal;
  StartLongitude : Decimal;
  StartPostalCode : String;
  StartState : String;
  Status : String;
  TimeZone : String;
  TimeZoneId : Integer;
  UpgradedDateTime : String;
  Vendor : String;
  VendorFlags : String;
  VendorName : String;
};

type Itinerary.API_types.Fixed {
  Amount : Decimal;
  Currency : String;
  Description : String;
  IsPaid : Boolean;
  IsPrimary : Boolean;
  SemanticsCode : String;
  SemanticsVendorType : String;
  StartDateLocal : String;
  Vendor : String;
  VendorChargeCode : String;
};

type Itinerary.API_types.FrequentFlyer {
  AirlineVendor : String;
  Description : String;
  DiscountProgramExpirationDate : String;
  DiscountProgramType : String;
  FrequentFlyerNumber : String;
  Status : String;
  StatusExpirationDate : String;
};

type Itinerary.API_types.FrequentTravelerProgram {
  FrequentFlyer : many Itinerary.API_types.FrequentFlyer;
  RailProgram : many Itinerary.API_types.RailProgram;
};

type Itinerary.API_types.Hotel {
  Breakfast : Boolean;
  CancellationNumber : String;
  CancellationPolicy : String;
  Charges : Itinerary.API_types.ChargeDetail;
  CheckinTime : String;
  CheckoutTime : String;
  ConfirmationNumber : String;
  Currency : String;
  DailyRate : Decimal;
  DateCancelledUtc : String;
  DateCreatedUtc : String;
  DateModifiedUtc : String;
  DirectBill : Boolean;
  DiscountCode : String;
  Email : String;
  EndDateLocal : String;
  EndDateUtc : String;
  EquipmentCode : String;
  FaxNumber : String;
  FrequentTravelerId : String;
  HotelPropertyId : String;
  IncludedCustomAmenities : String;
  IsGhostCard : Boolean;
  IsPreferredVendor : Integer;
  IsUpgradeAllowed : Boolean;
  ModificationCode : String;
  Name : String;
  Notes : String;
  NumPersons : Integer;
  NumRooms : Integer;
  Parking : Boolean;
  PartnerMembershipId : String;
  PassiveType : String;
  PhoneNumber : String;
  RateAccess : String;
  RateCode : String;
  RateType : String;
  Remarks : Itinerary.API_types.Remarks;
  RoomDescription : String;
  RoomType : String;
  SpecialInstructions : String;
  StartAddress : String;
  StartAddress2 : String;
  StartCity : String;
  StartCityCode : String;
  StartCountry : String;
  StartDateLocal : String;
  StartDateUtc : String;
  StartLatitude : Decimal;
  StartLongitude : Decimal;
  StartPostalCode : String;
  StartState : String;
  Status : String;
  TimeZone : String;
  TimeZoneId : Integer;
  TotalRate : Decimal;
  UpgradedDateTime : String;
  Vendor : String;
  VendorFlags : String;
  VendorName : String;
  Wifi : Boolean;
};

type Itinerary.API_types.Itinerary {
  BookedByFirstName : String;
  BookedByLastName : String;
  BookedVia : String;
  Bookings : many Itinerary.API_types.Booking;
  CancelComments : String;
  ClientLocator : String;
  Comments : String;
  CustomAttributes : many Itinerary.API_types.CustomAttribute;
  DateBookedLocal : String;
  DateCreatedUtc : String;
  DateModifiedUtc : String;
  Description : String;
  EndDateLocal : String;
  EndDateUtc : String;
  HasOpenBookingPassive : Boolean;
  IsPersonal : Boolean;
  ItinLocator : String;
  ProjectName : String;
  StartDateLocal : String;
  StartDateUtc : String;
  TravelRequestId : String;
  TripLinkLocator : String;
  TripName : String;
  TripStatus : Integer;
  UserLoginId : String;
  id : String;
};

type Itinerary.API_types.ManualAirlineTicket {
  AirlineCharges : Itinerary.API_types.ChargeDetail;
  BaseFare : Decimal;
  BaseFareCurrency : String;
  DateCreatedUtc : String;
  DateModifiedUtc : String;
  Taxes : many Itinerary.API_types.Tax;
  TotalFare : Decimal;
  TotalFareCurrency : String;
};

type Itinerary.API_types.MiscellaneousChargeOrder {
  DateCreatedUtc : String;
  DateModifiedUtc : String;
  IssueDate : String;
  PlatingCarrierNumericCode : String;
  PlatingControlNumber : String;
  TotalAmount : Decimal;
  TotalAmountCurrency : String;
};

type Itinerary.API_types.Parking {
  CancellationNumber : String;
  Charges : Itinerary.API_types.ChargeDetail;
  ClassOfService : String;
  ConfirmationNumber : String;
  Currency : String;
  DateCancelledUtc : String;
  DateCreatedUtc : String;
  DateModifiedUtc : String;
  EndDateLocal : String;
  EndDateUtc : String;
  FrequentTravelerId : String;
  IsPreferredVendor : Integer;
  IsUpgradeAllowed : Boolean;
  Name : String;
  Notes : String;
  OperatedByVendor : String;
  ParkingLocationId : String;
  PhoneNumber : String;
  Pin : String;
  RateCode : String;
  Remarks : Itinerary.API_types.Remarks;
  StartAddress : String;
  StartAddress2 : String;
  StartCity : String;
  StartCityCode : String;
  StartCountry : String;
  StartDateLocal : String;
  StartDateUtc : String;
  StartLocation : String;
  StartPostalCode : String;
  StartState : String;
  Status : String;
  TimeZone : String;
  TimeZoneId : Integer;
  TotalRate : Decimal;
  UpgradedDateTime : String;
  Vendor : String;
  VendorFlags : String;
  VendorName : String;
};

type Itinerary.API_types.PassProgram {
  Amount : Decimal;
  Name : String;
  Type : String;
  UserFirstName : String;
  UserLastName : String;
};

type Itinerary.API_types.Passenger {
  City : String;
  Country : String;
  FirstNameNumber : Integer;
  FrequentTravelerPrograms : Itinerary.API_types.FrequentTravelerProgram;
  LastNameNumber : Integer;
  NameFirst : String;
  NameLast : String;
  NameMiddle : String;
  NamePrefix : String;
  NameRemark : String;
  NameSuffix : String;
  NameTitle : String;
  PostalCode : String;
  State : String;
  StreetAddress : String;
  StreetAddress2 : String;
  TextName : String;
};

type Itinerary.API_types.Percent {
  Amount : Decimal;
  Currency : String;
  Description : String;
  IsPaid : Boolean;
  IsPrimary : Boolean;
  SemanticsCode : String;
  SemanticsVendorType : String;
  StartDateLocal : String;
  Vendor : String;
  VendorChargeCode : String;
};

type Itinerary.API_types.PhoneNumberData {
  Description : String;
  PassengerRPH : Integer;
  PhoneNumber : String;
  Type : String;
};

type Itinerary.API_types.Quote {
  AirlineCharges : Itinerary.API_types.ChargeDetail;
  BaseFare : Decimal;
  BaseFareCurrency : String;
  BaseFareNuc : Decimal;
  BaseFareNucCurrency : String;
  DateCreatedUtc : String;
  DateModifiedUtc : String;
  Endorsements : String;
  IssueByDate : String;
  TotalFare : Decimal;
  TotalFareCurrency : String;
};

type Itinerary.API_types.Rail {
  Amenities : String;
  Cabin : String;
  CancellationNumber : String;
  CarbonEmissionLbs : Decimal;
  CarbonModel : Integer;
  Charges : Itinerary.API_types.ChargeDetail;
  ClassOfService : String;
  ConfirmationNumber : String;
  Currency : String;
  DateCancelledUtc : String;
  DateCreatedUtc : String;
  DateModifiedUtc : String;
  DiscountCode : String;
  Duration : Integer;
  ETicket : String;
  EndCity : String;
  EndCityCode : String;
  EndCountry : String;
  EndDateLocal : String;
  EndDateUtc : String;
  EndLatitude : Decimal;
  EndLongitude : Decimal;
  EndPlatform : String;
  EndRailStation : String;
  EndRailStationName : String;
  EndState : String;
  FrequentTravelerId : String;
  IsPreferredVendor : Integer;
  IsUpgradeAllowed : Boolean;
  LegId : Integer;
  Meals : String;
  Miles : Integer;
  Notes : String;
  NumPersons : Integer;
  NumStops : Integer;
  OperatedByTrainNumber : String;
  OperatedByVendor : String;
  RateCode : String;
  Remarks : Itinerary.API_types.Remarks;
  RouteRestrictCode : String;
  Seats : many Itinerary.API_types.RailSeat;
  SpecialInstructions : String;
  StartCity : String;
  StartCityCode : String;
  StartCountry : String;
  StartDateLocal : String;
  StartDateUtc : String;
  StartLatitude : Decimal;
  StartLongitude : Decimal;
  StartPlatform : String;
  StartRailStation : String;
  StartRailStationName : String;
  StartState : String;
  Status : String;
  TimeZone : String;
  TimeZoneId : Integer;
  TotalRate : Decimal;
  TrainNumber : String;
  TrainTypeCode : String;
  TrainTypeName : String;
  TransportMode : String;
  UpgradedDateTime : String;
  Vendor : String;
  VendorFlags : String;
  VendorName : String;
  WagonNumber : String;
};

type Itinerary.API_types.RailAdjustment {
  AdjustmentDateTime : String;
  AdjustmentDateTimeUTC : String;
  AdjustmentType : String;
  DateCreatedUtc : String;
  DateModifiedUtc : String;
  RailCharges : Itinerary.API_types.ChargeDetail;
  Taxes : many Itinerary.API_types.Tax;
  TicketDocumentIdentifier : String;
  TotalAdjustment : Decimal;
  TotalAdjustmentCurrency : String;
};

type Itinerary.API_types.RailPayment {
  BaseFare : Decimal;
  BaseFareCurrency : String;
  DateCreatedUtc : String;
  DateModifiedUtc : String;
  IncludesVAT : Boolean;
  IssueByDate : String;
  IssueDateTime : String;
  IssueDateTimeUTC : String;
  RailCharges : Itinerary.API_types.ChargeDetail;
  TaxInvoice : Boolean;
  Taxes : many Itinerary.API_types.Tax;
  TicketDocumentIdentifier : String;
  TicketType : String;
  TotalFare : Decimal;
  TotalFareCurrency : String;
  vatApplicable : Boolean;
};

type Itinerary.API_types.RailProgram {
  Description : String;
  DiscountProgramExpirationDate : String;
  DiscountProgramType : String;
  ProgramNumber : String;
  Status : String;
  StatusExpirationDate : String;
};

type Itinerary.API_types.RailSeat {
  Amenities : String;
  BerthPosition : String;
  Deck : String;
  FacingForward : String;
  FareSpaceComfort : String;
  PassengerRph : Integer;
  SeatNumber : String;
  SeatPosition : String;
  SeatType : String;
  SpaceType : String;
  Status : String;
  WagonNumber : String;
  WagonType : String;
};

type Itinerary.API_types.Rate {
  Amount : Decimal;
  Currency : String;
  Description : String;
  IsPaid : Boolean;
  IsPrimary : Boolean;
  NumUnits : Decimal;
  PerUnit : String;
  SemanticsCode : String;
  SemanticsVendorType : String;
  StartDateLocal : String;
  Vendor : String;
  VendorChargeCode : String;
};

type Itinerary.API_types.RateWithAllowance {
  AllowanceAmount : Decimal;
  AllowanceIsUnlimited : Boolean;
  AllowanceNumUnits : Decimal;
  AllowanceUnit : String;
  Amount : Decimal;
  Currency : String;
  Description : String;
  IsPaid : Boolean;
  IsPrimary : Boolean;
  NumUnits : Decimal;
  PerUnit : String;
  SemanticsCode : String;
  SemanticsVendorType : String;
  StartDateLocal : String;
  Vendor : String;
  VendorChargeCode : String;
};

type Itinerary.API_types.Remarks {
  TripLinkRemarks : many Itinerary.API_types.TripLinkRemarks;
};

type Itinerary.API_types.Ride {
  CancellationNumber : String;
  CancellationPolicy : String;
  Charges : Itinerary.API_types.ChargeDetail;
  ConfirmationNumber : String;
  Currency : String;
  DateCancelledUtc : String;
  DateCreatedUtc : String;
  DateModifiedUtc : String;
  DropoffInstructions : String;
  Duration : Integer;
  EndAddress : String;
  EndAddress2 : String;
  EndCity : String;
  EndCityCode : String;
  EndCountry : String;
  EndDateLocal : String;
  EndDateUtc : String;
  EndLatitude : Decimal;
  EndLocationCode : String;
  EndLongitude : Decimal;
  EndPostalCode : String;
  EndState : String;
  IsGhostCard : Boolean;
  IsPreferredVendor : Integer;
  IsUpgradeAllowed : Boolean;
  MeetingInstructions : String;
  Miles : Integer;
  Name : String;
  Notes : String;
  NumPersons : Integer;
  NumberOfHours : Decimal;
  OperatedByVendorName : String;
  PassiveCityCode : String;
  PhoneNumber : String;
  PickupInstructions : String;
  ProviderFeedback : String;
  Rate : Decimal;
  RateDescription : String;
  RateNotes : String;
  RateType : String;
  Remarks : Itinerary.API_types.Remarks;
  ReservationId : String;
  SpecialInstructions : String;
  StartAddress : String;
  StartAddress2 : String;
  StartCity : String;
  StartCityCode : String;
  StartCountry : String;
  StartDateLocal : String;
  StartDateUtc : String;
  StartLatitude : Decimal;
  StartLocation : String;
  StartLocationCode : String;
  StartLocationName : String;
  StartLongitude : Decimal;
  StartPostalCode : String;
  StartState : String;
  TimeZone : String;
  TimeZoneId : Integer;
  TotalRate : Decimal;
  UpgradedDateTime : String;
  Vendor : String;
  VendorFlags : String;
  VendorName : String;
};

type Itinerary.API_types.RuleViolation {
  CompanyReasonCode : String;
  CompanyRuleText : String;
  ViolationReasonCode : Integer;
};

type Itinerary.API_types.Segment {
  Air : many Itinerary.API_types.Air;
  Car : many Itinerary.API_types.Car;
  Dining : many Itinerary.API_types.Dining;
  Hotel : many Itinerary.API_types.Hotel;
  Parking : many Itinerary.API_types.Parking;
  Rail : many Itinerary.API_types.Rail;
  Ride : many Itinerary.API_types.Ride;
  Travel : many Itinerary.API_types.Travel;
};

type Itinerary.API_types.SegmentOptionFlightType {
  ArrAirp : String;
  Cabin : String;
  Carrier : String;
  DepAirp : String;
  FlightNum : String;
};

type Itinerary.API_types.SegmentOptionItem {
  Flight : many Itinerary.API_types.SegmentOptionFlightType;
  SegmentIndex : String;
  StatusCode : String;
  TimeStamp : String;
};

type Itinerary.API_types.Tax {
  TaxAmount : Decimal;
  TaxAuthority : String;
  TaxName : String;
  TaxRate : Decimal;
  TaxType : String;
};

type Itinerary.API_types.Travel {
  CancellationNumber : String;
  Charges : Itinerary.API_types.ChargeDetail;
  ConfirmationNumber : String;
  Currency : String;
  DailyRate : Decimal;
  DateCancelledUtc : String;
  DateCreatedUtc : String;
  DateModifiedUtc : String;
  EndAddress : String;
  EndAddress2 : String;
  EndCity : String;
  EndCityCode : String;
  EndCountry : String;
  EndDateLocal : String;
  EndDateUtc : String;
  EndLatitude : Decimal;
  EndLocation : String;
  EndLongitude : Decimal;
  EndPostalCode : String;
  EndState : String;
  IsGhostCard : Boolean;
  Notes : String;
  NumPersons : Integer;
  PhoneNumber : String;
  Remarks : Itinerary.API_types.Remarks;
  SpecialInstructions : String;
  StartAddress : String;
  StartAddress2 : String;
  StartCity : String;
  StartCityCode : String;
  StartCountry : String;
  StartDateLocal : String;
  StartDateUtc : String;
  StartLatitude : Decimal;
  StartLocation : String;
  StartLongitude : Decimal;
  StartPostalCode : String;
  StartState : String;
  Status : String;
  TimeZone : String;
  TimeZoneId : Integer;
  TotalRate : Decimal;
  TransportMode : String;
  Vendor : String;
  VendorName : String;
};

type Itinerary.API_types.TripLinkRemark {
  Text : String;
};

type Itinerary.API_types.TripLinkRemarks {
  TripLinkRemark : many Itinerary.API_types.TripLinkRemark;
};

type Itinerary.API_types.WaitListSegments {
  SegmentOption : many Itinerary.API_types.SegmentOptionItem;
};

type Itinerary.API_types.Warning {
  Code : many String;
  Text : many String;
  Type : many String;
};

type Itinerary.API_types.WebAddressData {
  Description : String;
  Format : String;
  PassengerRPH : Integer;
  Type : String;
  WebAddress : String;
};

type Itinerary.API_types.model_ErrorAPIResponse {
  errors : many Itinerary.API_types.model_ExternalErrorObject;
};

type Itinerary.API_types.model_ExternalErrorObject {
  errorCode : String;
  errorMessage : String;
  errors : many Itinerary.API_types.model_ExternalErrorObject;
};

type Itinerary.API_types.model_ItineraryIdListResponse {
  data : many Itinerary.API_types.model_ItineraryIdObject;
  operations : many Itinerary.API_types.model_ItineraryListOperationObject;
};

type Itinerary.API_types.model_ItineraryIdObject {
  id : String;
  href : String;
};

type Itinerary.API_types.model_ItineraryListOperationObject {
  rel : String;
  href : String;
};

