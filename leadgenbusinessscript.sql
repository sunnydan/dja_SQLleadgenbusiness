use lead_gen_business;
select sum(billing.amount) from billing where month(billing.charged_datetime) = 3 and year(billing.charged_datetime) = 2012;

select sum(billing.amount) from billing join clients on billing.client_id = clients.client_id where clients.client_id = 2;

select * from sites join clients on sites.client_id = clients.client_id where clients.client_id = 10;

select year(sites.created_datetime), month(sites.created_datetime), count(sites.site_id) from sites 
join clients on sites.client_id = clients.client_id 
where clients.client_id = 1 
group by year(sites.created_datetime), month(sites.created_datetime);

select year(sites.created_datetime), month(sites.created_datetime), count(sites.site_id) from sites 
join clients on sites.client_id = clients.client_id 
where clients.client_id = 20
group by year(sites.created_datetime), month(sites.created_datetime);

select count(leads.leads_id) from sites
join leads on leads.site_id = sites.site_id
where year(leads.registered_datetime) = 2011
and month(leads.registered_datetime) < 3
and day(leads.registered_datetime) < 15
group by sites.site_id;

select clients.first_name, sum(leads.leads_id) from clients
join sites on sites.client_id = clients.client_id
join leads on leads.site_id = sites.site_id
where year(leads.registered_datetime) = 2011
group by clients.first_name;

select clients.first_name, sum(leads.leads_id) from clients
join sites on sites.client_id = clients.client_id
join leads on leads.site_id = sites.site_id
where year(leads.registered_datetime) = 2011 and
month(leads.registered_datetime) < 7
group by month(leads.registered_datetime);

select clients.client_id, clients.first_name, sum(leads.leads_id) from clients
join sites on sites.client_id = clients.client_id
join leads on leads.site_id = sites.site_id
where year(leads.registered_datetime) = 2011
group by clients.first_name
order by clients.client_id;

select clients.client_id, clients.first_name, sites.domain_name, (leads.leads_id) from clients
join sites on sites.client_id = clients.client_id
join leads on leads.site_id = sites.site_id
where year(leads.registered_datetime) = 2011
order by clients.client_id;

select clients.client_id, clients.first_name, billing.amount, month(billing.charged_datetime), year(billing.charged_datetime) from clients
join billing on billing.client_id = clients.client_id
group by year(billing.charged_datetime), month(billing.charged_datetime)
order by clients.client_id;

select clients.first_name, group_concat(sites.domain_name) from clients
join sites on sites.client_id = clients.client_id
group by sites.client_id
order by clients.first_name;
