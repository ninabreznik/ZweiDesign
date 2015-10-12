ActiveAdmin.register Lead do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :business_type, :zip, :location, :description, :time, :name, :email, :phone, :title
  #
  index do
    selectable_column
    id_column
      column :business_type
      column :zip
      column :location
      column :title
      column :description
      column :time
      column :name
      column :email
      column :phone
    actions
  end

  filter :business_type
  filter :zip
  filter :location
  filter :description
  filter :time
  filter :title
  filter :name
  filter :email
  filter :phone
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs "Lead Details" do
      f.input :business_type, collection: [
      ["#{I18n.t'lead-new.form.business-types.field-1'}"],
      ["#{I18n.t'lead-new.form.business-types.field-2'}"],
      ["#{I18n.t'lead-new.form.business-types.field-3'}"],
      ["#{I18n.t'lead-new.form.business-types.field-4'}"],
      ["#{I18n.t'lead-new.form.business-types.field-5'}"],
      ["#{I18n.t'lead-new.form.business-types.field-6'}"],
      ["#{I18n.t'lead-new.form.business-types.field-7'}"],
      ["#{I18n.t'lead-new.form.business-types.field-8'}"],
      ["#{I18n.t'lead-new.form.business-types.field-9'}"],
      ["#{I18n.t'lead-new.form.business-types.field-10'}"]
    ]
      f.input :zip
      f.input :location, collection: [
        ["#{I18n.t'lead-new.form.country-0'}", "#{I18n.t'lead-new.form.country-0'}"],
        ["#{I18n.t'lead-new.form.country-1'}", "#{I18n.t'lead-new.form.country-1'}"],
        ["#{I18n.t'lead-new.form.country-2'}", "#{I18n.t'lead-new.form.country-2'}"],
        ["#{I18n.t'lead-new.form.country-3'}", "#{I18n.t'lead-new.form.country-3'}"],
        ["#{I18n.t'lead-new.form.country-4'}", "#{I18n.t'lead-new.form.country-4'}"],
        ["#{I18n.t'lead-new.form.country-5'}", "#{I18n.t'lead-new.form.country-5'}"],
        ["#{I18n.t'lead-new.form.country-6'}", "#{I18n.t'lead-new.form.country-6'}"],
        ["#{I18n.t'lead-new.form.country-7'}", "#{I18n.t'lead-new.form.country-7'}"],
        ["#{I18n.t'lead-new.form.country-8'}", "#{I18n.t'lead-new.form.country-8'}"],
        ["#{I18n.t'lead-new.form.country-9'}", "#{I18n.t'lead-new.form.country-9'}"],
        ["#{I18n.t'lead-new.form.country-10'}", "#{I18n.t'lead-new.form.country-10'}"],
        ["#{I18n.t'lead-new.form.country-11'}", "#{I18n.t'lead-new.form.country-11'}"],
        ["#{I18n.t'lead-new.form.country-12'}", "#{I18n.t'lead-new.form.country-12'}"],
        ["#{I18n.t'lead-new.form.country-13'}", "#{I18n.t'lead-new.form.country-13'}"],
        ["#{I18n.t'lead-new.form.country-14'}", "#{I18n.t'lead-new.form.country-14'}"],
        ["#{I18n.t'lead-new.form.country-15'}", "#{I18n.t'lead-new.form.country-15'}"],
        ["#{I18n.t'lead-new.form.country-16'}", "#{I18n.t'lead-new.form.country-16'}"],
        ["#{I18n.t'lead-new.form.country-17'}", "#{I18n.t'lead-new.form.country-17'}"],
        ["#{I18n.t'lead-new.form.country-18'}", "#{I18n.t'lead-new.form.country-18'}"],
        ["#{I18n.t'lead-new.form.country-19'}", "#{I18n.t'lead-new.form.country-19'}"],
        ["#{I18n.t'lead-new.form.country-20'}", "#{I18n.t'lead-new.form.country-20'}"],
        ["#{I18n.t'lead-new.form.country-21'}", "#{I18n.t'lead-new.form.country-21'}"],
        ["#{I18n.t'lead-new.form.country-22'}", "#{I18n.t'lead-new.form.country-22'}"],
        ["#{I18n.t'lead-new.form.country-23'}", "#{I18n.t'lead-new.form.country-23'}"],
        ["#{I18n.t'lead-new.form.country-24'}", "#{I18n.t'lead-new.form.country-24'}"],
        ["#{I18n.t'lead-new.form.country-25'}", "#{I18n.t'lead-new.form.country-25'}"],
        ["#{I18n.t'lead-new.form.country-26'}", "#{I18n.t'lead-new.form.country-26'}"],
        ["#{I18n.t'lead-new.form.country-27'}", "#{I18n.t'lead-new.form.country-27'}"],
        ["#{I18n.t'lead-new.form.country-28'}", "#{I18n.t'lead-new.form.country-28'}"],
        ["#{I18n.t'lead-new.form.country-29'}", "#{I18n.t'lead-new.form.country-29'}"],
        ["#{I18n.t'lead-new.form.country-30'}", "#{I18n.t'lead-new.form.country-30'}"],
        ["#{I18n.t'lead-new.form.country-31'}", "#{I18n.t'lead-new.form.country-31'}"],
        ["#{I18n.t'lead-new.form.country-32'}", "#{I18n.t'lead-new.form.country-32'}"],
        ["#{I18n.t'lead-new.form.country-33'}", "#{I18n.t'lead-new.form.country-33'}"],
        ["#{I18n.t'lead-new.form.country-34'}", "#{I18n.t'lead-new.form.country-34'}"],
        ["#{I18n.t'lead-new.form.country-35'}", "#{I18n.t'lead-new.form.country-35'}"],
        ["#{I18n.t'lead-new.form.country-36'}", "#{I18n.t'lead-new.form.country-36'}"],
        ["#{I18n.t'lead-new.form.country-37'}", "#{I18n.t'lead-new.form.country-37'}"],
        ["#{I18n.t'lead-new.form.country-38'}", "#{I18n.t'lead-new.form.country-38'}"],
        ["#{I18n.t'lead-new.form.country-39'}", "#{I18n.t'lead-new.form.country-39'}"],
        ["#{I18n.t'lead-new.form.country-40'}", "#{I18n.t'lead-new.form.country-40'}"],
        ["#{I18n.t'lead-new.form.country-41'}", "#{I18n.t'lead-new.form.country-41'}"],
        ["#{I18n.t'lead-new.form.country-42'}", "#{I18n.t'lead-new.form.country-42'}"],
        ["#{I18n.t'lead-new.form.country-43'}", "#{I18n.t'lead-new.form.country-43'}"],
        ["#{I18n.t'lead-new.form.country-44'}", "#{I18n.t'lead-new.form.country-44'}"],
        ["#{I18n.t'lead-new.form.country-45'}", "#{I18n.t'lead-new.form.country-45'}"],
        ["#{I18n.t'lead-new.form.country-46'}", "#{I18n.t'lead-new.form.country-46'}"],
        ["#{I18n.t'lead-new.form.country-47'}", "#{I18n.t'lead-new.form.country-47'}"],
        ["#{I18n.t'lead-new.form.country-48'}", "#{I18n.t'lead-new.form.country-48'}"],
        ["#{I18n.t'lead-new.form.country-49'}", "#{I18n.t'lead-new.form.country-49'}"],
        ["#{I18n.t'lead-new.form.country-50'}", "#{I18n.t'lead-new.form.country-50'}"],
        ["#{I18n.t'lead-new.form.country-51'}", "#{I18n.t'lead-new.form.country-51'}"],
        ["#{I18n.t'lead-new.form.country-52'}", "#{I18n.t'lead-new.form.country-52'}"],
        ["#{I18n.t'lead-new.form.country-53'}", "#{I18n.t'lead-new.form.country-53'}"],
        ["#{I18n.t'lead-new.form.country-54'}", "#{I18n.t'lead-new.form.country-54'}"],
        ["#{I18n.t'lead-new.form.country-55'}", "#{I18n.t'lead-new.form.country-55'}"],
        ["#{I18n.t'lead-new.form.country-56'}", "#{I18n.t'lead-new.form.country-56'}"],
        ["#{I18n.t'lead-new.form.country-57'}", "#{I18n.t'lead-new.form.country-57'}"],
        ["#{I18n.t'lead-new.form.country-58'}", "#{I18n.t'lead-new.form.country-58'}"],
        ["#{I18n.t'lead-new.form.country-59'}", "#{I18n.t'lead-new.form.country-59'}"],
        ["#{I18n.t'lead-new.form.country-60'}", "#{I18n.t'lead-new.form.country-60'}"],
        ["#{I18n.t'lead-new.form.country-61'}", "#{I18n.t'lead-new.form.country-61'}"],
        ["#{I18n.t'lead-new.form.country-62'}", "#{I18n.t'lead-new.form.country-62'}"],
        ["#{I18n.t'lead-new.form.country-63'}", "#{I18n.t'lead-new.form.country-63'}"],
        ["#{I18n.t'lead-new.form.country-64'}", "#{I18n.t'lead-new.form.country-64'}"],
        ["#{I18n.t'lead-new.form.country-65'}", "#{I18n.t'lead-new.form.country-65'}"],
        ["#{I18n.t'lead-new.form.country-66'}", "#{I18n.t'lead-new.form.country-66'}"],
        ["#{I18n.t'lead-new.form.country-67'}", "#{I18n.t'lead-new.form.country-67'}"],
        ["#{I18n.t'lead-new.form.country-68'}", "#{I18n.t'lead-new.form.country-68'}"],
        ["#{I18n.t'lead-new.form.country-69'}", "#{I18n.t'lead-new.form.country-69'}"],
        ["#{I18n.t'lead-new.form.country-70'}", "#{I18n.t'lead-new.form.country-70'}"],
        ["#{I18n.t'lead-new.form.country-71'}", "#{I18n.t'lead-new.form.country-71'}"],
        ["#{I18n.t'lead-new.form.country-72'}", "#{I18n.t'lead-new.form.country-72'}"],
        ["#{I18n.t'lead-new.form.country-73'}", "#{I18n.t'lead-new.form.country-73'}"],
        ["#{I18n.t'lead-new.form.country-74'}", "#{I18n.t'lead-new.form.country-74'}"],
        ["#{I18n.t'lead-new.form.country-75'}", "#{I18n.t'lead-new.form.country-75'}"],
        ["#{I18n.t'lead-new.form.country-76'}", "#{I18n.t'lead-new.form.country-76'}"],
        ["#{I18n.t'lead-new.form.country-77'}", "#{I18n.t'lead-new.form.country-77'}"],
        ["#{I18n.t'lead-new.form.country-78'}", "#{I18n.t'lead-new.form.country-78'}"],
        ["#{I18n.t'lead-new.form.country-79'}", "#{I18n.t'lead-new.form.country-79'}"],
        ["#{I18n.t'lead-new.form.country-80'}", "#{I18n.t'lead-new.form.country-80'}"],
        ["#{I18n.t'lead-new.form.country-81'}", "#{I18n.t'lead-new.form.country-81'}"],
        ["#{I18n.t'lead-new.form.country-82'}", "#{I18n.t'lead-new.form.country-82'}"],
        ["#{I18n.t'lead-new.form.country-83'}", "#{I18n.t'lead-new.form.country-83'}"],
        ["#{I18n.t'lead-new.form.country-84'}", "#{I18n.t'lead-new.form.country-84'}"],
        ["#{I18n.t'lead-new.form.country-85'}", "#{I18n.t'lead-new.form.country-85'}"],
        ["#{I18n.t'lead-new.form.country-86'}", "#{I18n.t'lead-new.form.country-86'}"],
        ["#{I18n.t'lead-new.form.country-87'}", "#{I18n.t'lead-new.form.country-87'}"],
        ["#{I18n.t'lead-new.form.country-88'}", "#{I18n.t'lead-new.form.country-88'}"],
        ["#{I18n.t'lead-new.form.country-89'}", "#{I18n.t'lead-new.form.country-89'}"],
        ["#{I18n.t'lead-new.form.country-90'}", "#{I18n.t'lead-new.form.country-90'}"],
        ["#{I18n.t'lead-new.form.country-91'}", "#{I18n.t'lead-new.form.country-91'}"],
        ["#{I18n.t'lead-new.form.country-92'}", "#{I18n.t'lead-new.form.country-92'}"],
        ["#{I18n.t'lead-new.form.country-93'}", "#{I18n.t'lead-new.form.country-93'}"],
        ["#{I18n.t'lead-new.form.country-94'}", "#{I18n.t'lead-new.form.country-94'}"],
        ["#{I18n.t'lead-new.form.country-95'}", "#{I18n.t'lead-new.form.country-95'}"],
        ["#{I18n.t'lead-new.form.country-96'}", "#{I18n.t'lead-new.form.country-96'}"],
        ["#{I18n.t'lead-new.form.country-97'}", "#{I18n.t'lead-new.form.country-97'}"],
        ["#{I18n.t'lead-new.form.country-98'}", "#{I18n.t'lead-new.form.country-98'}"],
        ["#{I18n.t'lead-new.form.country-99'}", "#{I18n.t'lead-new.form.country-99'}"],
        ["#{I18n.t'lead-new.form.country-100'}", "#{I18n.t'lead-new.form.country-100'}"],
        ["#{I18n.t'lead-new.form.country-101'}", "#{I18n.t'lead-new.form.country-101'}"],
        ["#{I18n.t'lead-new.form.country-102'}", "#{I18n.t'lead-new.form.country-102'}"],
        ["#{I18n.t'lead-new.form.country-103'}", "#{I18n.t'lead-new.form.country-103'}"],
        ["#{I18n.t'lead-new.form.country-104'}", "#{I18n.t'lead-new.form.country-104'}"],
        ["#{I18n.t'lead-new.form.country-105'}", "#{I18n.t'lead-new.form.country-105'}"],
        ["#{I18n.t'lead-new.form.country-106'}", "#{I18n.t'lead-new.form.country-106'}"],
        ["#{I18n.t'lead-new.form.country-107'}", "#{I18n.t'lead-new.form.country-107'}"],
        ["#{I18n.t'lead-new.form.country-108'}", "#{I18n.t'lead-new.form.country-108'}"],
        ["#{I18n.t'lead-new.form.country-109'}", "#{I18n.t'lead-new.form.country-109'}"],
        ["#{I18n.t'lead-new.form.country-110'}", "#{I18n.t'lead-new.form.country-110'}"],
        ["#{I18n.t'lead-new.form.country-111'}", "#{I18n.t'lead-new.form.country-111'}"],
        ["#{I18n.t'lead-new.form.country-112'}", "#{I18n.t'lead-new.form.country-112'}"],
        ["#{I18n.t'lead-new.form.country-113'}", "#{I18n.t'lead-new.form.country-113'}"],
        ["#{I18n.t'lead-new.form.country-114'}", "#{I18n.t'lead-new.form.country-114'}"],
        ["#{I18n.t'lead-new.form.country-115'}", "#{I18n.t'lead-new.form.country-115'}"],
        ["#{I18n.t'lead-new.form.country-116'}", "#{I18n.t'lead-new.form.country-116'}"],
        ["#{I18n.t'lead-new.form.country-117'}", "#{I18n.t'lead-new.form.country-117'}"],
        ["#{I18n.t'lead-new.form.country-118'}", "#{I18n.t'lead-new.form.country-118'}"],
        ["#{I18n.t'lead-new.form.country-119'}", "#{I18n.t'lead-new.form.country-119'}"],
        ["#{I18n.t'lead-new.form.country-120'}", "#{I18n.t'lead-new.form.country-120'}"],
        ["#{I18n.t'lead-new.form.country-121'}", "#{I18n.t'lead-new.form.country-121'}"],
        ["#{I18n.t'lead-new.form.country-122'}", "#{I18n.t'lead-new.form.country-122'}"],
        ["#{I18n.t'lead-new.form.country-123'}", "#{I18n.t'lead-new.form.country-123'}"],
        ["#{I18n.t'lead-new.form.country-124'}", "#{I18n.t'lead-new.form.country-124'}"],
        ["#{I18n.t'lead-new.form.country-125'}", "#{I18n.t'lead-new.form.country-125'}"],
        ["#{I18n.t'lead-new.form.country-126'}", "#{I18n.t'lead-new.form.country-126'}"],
        ["#{I18n.t'lead-new.form.country-127'}", "#{I18n.t'lead-new.form.country-127'}"],
        ["#{I18n.t'lead-new.form.country-128'}", "#{I18n.t'lead-new.form.country-128'}"],
        ["#{I18n.t'lead-new.form.country-129'}", "#{I18n.t'lead-new.form.country-129'}"],
        ["#{I18n.t'lead-new.form.country-130'}", "#{I18n.t'lead-new.form.country-130'}"],
        ["#{I18n.t'lead-new.form.country-131'}", "#{I18n.t'lead-new.form.country-131'}"],
        ["#{I18n.t'lead-new.form.country-132'}", "#{I18n.t'lead-new.form.country-132'}"],
        ["#{I18n.t'lead-new.form.country-133'}", "#{I18n.t'lead-new.form.country-133'}"],
        ["#{I18n.t'lead-new.form.country-134'}", "#{I18n.t'lead-new.form.country-134'}"],
        ["#{I18n.t'lead-new.form.country-135'}", "#{I18n.t'lead-new.form.country-135'}"],
        ["#{I18n.t'lead-new.form.country-136'}", "#{I18n.t'lead-new.form.country-136'}"],
        ["#{I18n.t'lead-new.form.country-137'}", "#{I18n.t'lead-new.form.country-137'}"],
        ["#{I18n.t'lead-new.form.country-138'}", "#{I18n.t'lead-new.form.country-138'}"],
        ["#{I18n.t'lead-new.form.country-139'}", "#{I18n.t'lead-new.form.country-139'}"],
        ["#{I18n.t'lead-new.form.country-140'}", "#{I18n.t'lead-new.form.country-140'}"],
        ["#{I18n.t'lead-new.form.country-141'}", "#{I18n.t'lead-new.form.country-141'}"],
        ["#{I18n.t'lead-new.form.country-142'}", "#{I18n.t'lead-new.form.country-142'}"],
        ["#{I18n.t'lead-new.form.country-143'}", "#{I18n.t'lead-new.form.country-143'}"],
        ["#{I18n.t'lead-new.form.country-144'}", "#{I18n.t'lead-new.form.country-144'}"],
        ["#{I18n.t'lead-new.form.country-145'}", "#{I18n.t'lead-new.form.country-145'}"],
        ["#{I18n.t'lead-new.form.country-146'}", "#{I18n.t'lead-new.form.country-146'}"],
        ["#{I18n.t'lead-new.form.country-147'}", "#{I18n.t'lead-new.form.country-147'}"],
        ["#{I18n.t'lead-new.form.country-148'}", "#{I18n.t'lead-new.form.country-148'}"],
        ["#{I18n.t'lead-new.form.country-149'}", "#{I18n.t'lead-new.form.country-149'}"],
        ["#{I18n.t'lead-new.form.country-150'}", "#{I18n.t'lead-new.form.country-150'}"],
        ["#{I18n.t'lead-new.form.country-151'}", "#{I18n.t'lead-new.form.country-151'}"],
        ["#{I18n.t'lead-new.form.country-152'}", "#{I18n.t'lead-new.form.country-152'}"],
        ["#{I18n.t'lead-new.form.country-153'}", "#{I18n.t'lead-new.form.country-153'}"],
        ["#{I18n.t'lead-new.form.country-154'}", "#{I18n.t'lead-new.form.country-154'}"],
        ["#{I18n.t'lead-new.form.country-155'}", "#{I18n.t'lead-new.form.country-155'}"],
        ["#{I18n.t'lead-new.form.country-156'}", "#{I18n.t'lead-new.form.country-156'}"],
        ["#{I18n.t'lead-new.form.country-157'}", "#{I18n.t'lead-new.form.country-157'}"],
        ["#{I18n.t'lead-new.form.country-158'}", "#{I18n.t'lead-new.form.country-158'}"],
        ["#{I18n.t'lead-new.form.country-159'}", "#{I18n.t'lead-new.form.country-159'}"],
        ["#{I18n.t'lead-new.form.country-160'}", "#{I18n.t'lead-new.form.country-160'}"],
        ["#{I18n.t'lead-new.form.country-161'}", "#{I18n.t'lead-new.form.country-161'}"],
        ["#{I18n.t'lead-new.form.country-162'}", "#{I18n.t'lead-new.form.country-162'}"],
        ["#{I18n.t'lead-new.form.country-163'}", "#{I18n.t'lead-new.form.country-163'}"],
        ["#{I18n.t'lead-new.form.country-164'}", "#{I18n.t'lead-new.form.country-164'}"],
        ["#{I18n.t'lead-new.form.country-165'}", "#{I18n.t'lead-new.form.country-165'}"],
        ["#{I18n.t'lead-new.form.country-166'}", "#{I18n.t'lead-new.form.country-166'}"],
        ["#{I18n.t'lead-new.form.country-167'}", "#{I18n.t'lead-new.form.country-167'}"],
        ["#{I18n.t'lead-new.form.country-168'}", "#{I18n.t'lead-new.form.country-168'}"],
        ["#{I18n.t'lead-new.form.country-169'}", "#{I18n.t'lead-new.form.country-169'}"],
        ["#{I18n.t'lead-new.form.country-170'}", "#{I18n.t'lead-new.form.country-170'}"],
        ["#{I18n.t'lead-new.form.country-171'}", "#{I18n.t'lead-new.form.country-171'}"],
        ["#{I18n.t'lead-new.form.country-172'}", "#{I18n.t'lead-new.form.country-172'}"],
        ["#{I18n.t'lead-new.form.country-173'}", "#{I18n.t'lead-new.form.country-173'}"],
        ["#{I18n.t'lead-new.form.country-174'}", "#{I18n.t'lead-new.form.country-174'}"],
        ["#{I18n.t'lead-new.form.country-175'}", "#{I18n.t'lead-new.form.country-175'}"],
        ["#{I18n.t'lead-new.form.country-176'}", "#{I18n.t'lead-new.form.country-176'}"],
        ["#{I18n.t'lead-new.form.country-177'}", "#{I18n.t'lead-new.form.country-177'}"],
        ["#{I18n.t'lead-new.form.country-178'}", "#{I18n.t'lead-new.form.country-178'}"],
        ["#{I18n.t'lead-new.form.country-179'}", "#{I18n.t'lead-new.form.country-179'}"],
        ["#{I18n.t'lead-new.form.country-180'}", "#{I18n.t'lead-new.form.country-180'}"],
        ["#{I18n.t'lead-new.form.country-181'}", "#{I18n.t'lead-new.form.country-181'}"],
        ["#{I18n.t'lead-new.form.country-182'}", "#{I18n.t'lead-new.form.country-182'}"],
        ["#{I18n.t'lead-new.form.country-183'}", "#{I18n.t'lead-new.form.country-183'}"],
        ["#{I18n.t'lead-new.form.country-184'}", "#{I18n.t'lead-new.form.country-184'}"],
        ["#{I18n.t'lead-new.form.country-185'}", "#{I18n.t'lead-new.form.country-185'}"],
        ["#{I18n.t'lead-new.form.country-186'}", "#{I18n.t'lead-new.form.country-186'}"],
        ["#{I18n.t'lead-new.form.country-187'}", "#{I18n.t'lead-new.form.country-187'}"],
        ["#{I18n.t'lead-new.form.country-188'}", "#{I18n.t'lead-new.form.country-188'}"],
        ["#{I18n.t'lead-new.form.country-189'}", "#{I18n.t'lead-new.form.country-189'}"],
        ["#{I18n.t'lead-new.form.country-190'}", "#{I18n.t'lead-new.form.country-190'}"],
        ["#{I18n.t'lead-new.form.country-191'}", "#{I18n.t'lead-new.form.country-191'}"],
        ["#{I18n.t'lead-new.form.country-192'}", "#{I18n.t'lead-new.form.country-192'}"],
        ["#{I18n.t'lead-new.form.country-193'}", "#{I18n.t'lead-new.form.country-193'}"],
        ["#{I18n.t'lead-new.form.country-194'}", "#{I18n.t'lead-new.form.country-194'}"],
        ["#{I18n.t'lead-new.form.country-195'}", "#{I18n.t'lead-new.form.country-195'}"],
        ["#{I18n.t'lead-new.form.country-196'}", "#{I18n.t'lead-new.form.country-196'}"],
        ["#{I18n.t'lead-new.form.country-197'}", "#{I18n.t'lead-new.form.country-197'}"],
        ["#{I18n.t'lead-new.form.country-198'}", "#{I18n.t'lead-new.form.country-198'}"],
        ["#{I18n.t'lead-new.form.country-199'}", "#{I18n.t'lead-new.form.country-199'}"],
        ["#{I18n.t'lead-new.form.country-200'}", "#{I18n.t'lead-new.form.country-200'}"],
        ["#{I18n.t'lead-new.form.country-201'}", "#{I18n.t'lead-new.form.country-201'}"],
        ["#{I18n.t'lead-new.form.country-202'}", "#{I18n.t'lead-new.form.country-202'}"],
        ["#{I18n.t'lead-new.form.country-203'}", "#{I18n.t'lead-new.form.country-203'}"],
        ["#{I18n.t'lead-new.form.country-204'}", "#{I18n.t'lead-new.form.country-204'}"],
        ["#{I18n.t'lead-new.form.country-205'}", "#{I18n.t'lead-new.form.country-205'}"],
        ["#{I18n.t'lead-new.form.country-206'}", "#{I18n.t'lead-new.form.country-206'}"],
        ["#{I18n.t'lead-new.form.country-207'}", "#{I18n.t'lead-new.form.country-207'}"],
        ["#{I18n.t'lead-new.form.country-208'}", "#{I18n.t'lead-new.form.country-208'}"],
        ["#{I18n.t'lead-new.form.country-209'}", "#{I18n.t'lead-new.form.country-209'}"],
        ["#{I18n.t'lead-new.form.country-210'}", "#{I18n.t'lead-new.form.country-210'}"],
        ["#{I18n.t'lead-new.form.country-211'}", "#{I18n.t'lead-new.form.country-211'}"],
        ["#{I18n.t'lead-new.form.country-212'}", "#{I18n.t'lead-new.form.country-212'}"],
        ["#{I18n.t'lead-new.form.country-213'}", "#{I18n.t'lead-new.form.country-213'}"],
        ["#{I18n.t'lead-new.form.country-214'}", "#{I18n.t'lead-new.form.country-214'}"],
        ["#{I18n.t'lead-new.form.country-215'}", "#{I18n.t'lead-new.form.country-215'}"],
        ["#{I18n.t'lead-new.form.country-216'}", "#{I18n.t'lead-new.form.country-216'}"],
        ["#{I18n.t'lead-new.form.country-217'}", "#{I18n.t'lead-new.form.country-217'}"],
        ["#{I18n.t'lead-new.form.country-218'}", "#{I18n.t'lead-new.form.country-218'}"],
        ["#{I18n.t'lead-new.form.country-219'}", "#{I18n.t'lead-new.form.country-219'}"],
        ["#{I18n.t'lead-new.form.country-220'}", "#{I18n.t'lead-new.form.country-220'}"],
        ["#{I18n.t'lead-new.form.country-221'}", "#{I18n.t'lead-new.form.country-221'}"],
        ["#{I18n.t'lead-new.form.country-222'}", "#{I18n.t'lead-new.form.country-222'}"],
        ["#{I18n.t'lead-new.form.country-223'}", "#{I18n.t'lead-new.form.country-223'}"],
        ["#{I18n.t'lead-new.form.country-224'}", "#{I18n.t'lead-new.form.country-224'}"],
        ["#{I18n.t'lead-new.form.country-225'}", "#{I18n.t'lead-new.form.country-225'}"],
        ["#{I18n.t'lead-new.form.country-226'}", "#{I18n.t'lead-new.form.country-226'}"],
        ["#{I18n.t'lead-new.form.country-227'}", "#{I18n.t'lead-new.form.country-227'}"],
        ["#{I18n.t'lead-new.form.country-228'}", "#{I18n.t'lead-new.form.country-228'}"],
        ["#{I18n.t'lead-new.form.country-229'}", "#{I18n.t'lead-new.form.country-229'}"],
        ["#{I18n.t'lead-new.form.country-230'}", "#{I18n.t'lead-new.form.country-230'}"],
        ["#{I18n.t'lead-new.form.country-231'}", "#{I18n.t'lead-new.form.country-231'}"],
        ["#{I18n.t'lead-new.form.country-232'}", "#{I18n.t'lead-new.form.country-232'}"],
        ["#{I18n.t'lead-new.form.country-233'}", "#{I18n.t'lead-new.form.country-233'}"],
        ["#{I18n.t'lead-new.form.country-234'}", "#{I18n.t'lead-new.form.country-234'}"],
        ["#{I18n.t'lead-new.form.country-235'}", "#{I18n.t'lead-new.form.country-235'}"],
        ["#{I18n.t'lead-new.form.country-236'}", "#{I18n.t'lead-new.form.country-236'}"],
        ["#{I18n.t'lead-new.form.country-237'}", "#{I18n.t'lead-new.form.country-237'}"],
        ["#{I18n.t'lead-new.form.country-238'}", "#{I18n.t'lead-new.form.country-238'}"],
        ["#{I18n.t'lead-new.form.country-239'}", "#{I18n.t'lead-new.form.country-239'}"],
        ["#{I18n.t'lead-new.form.country-240'}", "#{I18n.t'lead-new.form.country-240'}"],
        ["#{I18n.t'lead-new.form.country-241'}", "#{I18n.t'lead-new.form.country-241'}"],
        ["#{I18n.t'lead-new.form.country-242'}", "#{I18n.t'lead-new.form.country-242'}"],
        ["#{I18n.t'lead-new.form.country-243'}", "#{I18n.t'lead-new.form.country-243'}"],
        ["#{I18n.t'lead-new.form.country-244'}", "#{I18n.t'lead-new.form.country-244'}"],
        ["#{I18n.t'lead-new.form.country-245'}", "#{I18n.t'lead-new.form.country-245'}"],
        ["#{I18n.t'lead-new.form.country-246'}", "#{I18n.t'lead-new.form.country-246'}"],
        ["#{I18n.t'lead-new.form.country-247'}", "#{I18n.t'lead-new.form.country-247'}"],
        ["#{I18n.t'lead-new.form.country-248'}", "#{I18n.t'lead-new.form.country-248'}"],
        ["#{I18n.t'lead-new.form.country-249'}", "#{I18n.t'lead-new.form.country-249'}"]
    ]
      f.input :description
      f.input :time
      f.input :title
      f.input :name
      f.input :email
      f.input :phone
    end
    f.actions
  end







end
