-- Raccolta di helper e dati per generare le definizioni di spawn degli asteroidi.
-- Il modulo costruisce sia le tabelle usate lungo le rotte spaziali, sia le
-- definizioni specifiche per le singole location/planets.
local asteroid_functions = {}

-- Velocita di riferimento usata come base per tutti gli spawn point generati.
asteroid_functions.standard_speed = 1 * meter/second

-- Interpolazione lineare fra due valori.
-- Serve per passare in modo graduale da una fascia di spawn all'altra.
asteroid_functions.weighted_average = function(A, B, weight)
  local result = A + ((B-A)*weight)
  return result
end

-- Rapporti relativi tra i tipi di asteroide nelle varie zone del sistema.
-- L'ordine dei valori e: metallic, carbonic, oxide, promethium, irony, coppery, rocky, tungsten.
asteroid_functions.axos_ratio        = {0, 5, 0 , 0, 1, 1, 5, 0}
asteroid_functions.keria_ratio       = {0, 0, 5 , 0, 1, 1, 5, 0}
asteroid_functions.nauvis_ratio      = {0, 0, 0 , 0, 4, 3, 5, 0}
asteroid_functions.vulcanus_ratio    = {0, 2, 1 , 0, 4, 3, 5, 5}
asteroid_functions.gleba_ratio       = {0, 5, 1 , 0, 4, 3, 5, 0}
asteroid_functions.fulgora_ratio     = {0, 3, 1 , 0, 4, 3, 5, 0}
asteroid_functions.aquilo_ratio      = {0, 2, 20, 0, 4, 3, 5, 0}
asteroid_functions.system_edge_ratio = {0, 5, 2 , 0, 4, 3, 5, 0}

-- Probabilita base per gli asteroidi nelle varie regioni.
-- Questi valori vengono poi interpolati lungo le connessioni tra location.
asteroid_functions.axos_chunks        = 0.0250
asteroid_functions.keria_chunks       = 0.0250
asteroid_functions.nauvis_chunks      = 0.0125
asteroid_functions.vulcanus_chunks    = 0.0020
asteroid_functions.vulcanus_medium    = 0.0025
asteroid_functions.gleba_chunks       = 0.0030
asteroid_functions.gleba_medium       = 0.0025
asteroid_functions.fulgora_chunks     = 0.0025
asteroid_functions.fulgora_medium     = 0.0025
asteroid_functions.aquilo_chunks      = 0.0010
asteroid_functions.aquilo_big         = 0.0025
asteroid_functions.system_edge_chunks = 0.0005
asteroid_functions.system_edge_huge   = 0.00125

asteroid_functions.chunk_angle = 1
asteroid_functions.small_angle = 0.7
asteroid_functions.medium_angle = 0.6
asteroid_functions.big_angle = 0.5
asteroid_functions.huge_angle = 0.4

-- Dati di transizione da Nauvis a Axos.
asteroid_functions.nauvis_axos =
{
  probability_on_range_chunk =
  {
    {position = 0.1, probability = asteroid_functions.nauvis_chunks, angle_when_stopped = asteroid_functions.chunk_angle},
    {position = 0.9, probability = asteroid_functions.axos_chunks, angle_when_stopped = asteroid_functions.chunk_angle}
  },
  probability_on_range_medium =
  {
    {position = 0.1, probability = 0, angle_when_stopped = asteroid_functions.medium_angle},
    {position = 0.5, probability = 0, angle_when_stopped = asteroid_functions.medium_angle},
    {position = 0.9, probability = 0, angle_when_stopped = asteroid_functions.medium_angle}
  },
  type_ratios =
  {
    {position = 0.1, ratios = asteroid_functions.nauvis_ratio},
    {position = 0.9, ratios = asteroid_functions.axos_ratio},
  }
}

-- Dati di transizione da Nauvis a Keria.
asteroid_functions.nauvis_keria =
{
  probability_on_range_chunk =
  {
    {position = 0.1, probability = asteroid_functions.nauvis_chunks, angle_when_stopped = asteroid_functions.chunk_angle},
    {position = 0.9, probability = asteroid_functions.keria_chunks, angle_when_stopped = asteroid_functions.chunk_angle}
  },
  probability_on_range_medium =
  {
    {position = 0.1, probability = 0, angle_when_stopped = asteroid_functions.medium_angle},
    {position = 0.5, probability = 0, angle_when_stopped = asteroid_functions.medium_angle},
    {position = 0.9, probability = 0, angle_when_stopped = asteroid_functions.medium_angle}
  },
  type_ratios =
  {
    {position = 0.1, ratios = asteroid_functions.nauvis_ratio},
    {position = 0.9, ratios = asteroid_functions.keria_ratio},
  }
}

-- Dati di transizione da Axos a Keria.
asteroid_functions.axos_keria =
{
  probability_on_range_chunk =
  {
    {position = 0.1, probability = asteroid_functions.axos_chunks, angle_when_stopped = asteroid_functions.chunk_angle},
    {position = 0.9, probability = asteroid_functions.keria_chunks, angle_when_stopped = asteroid_functions.chunk_angle}
  },
  probability_on_range_medium =
  {
    {position = 0.1, probability = 0, angle_when_stopped = asteroid_functions.medium_angle},
    {position = 0.5, probability = 0, angle_when_stopped = asteroid_functions.medium_angle},
    {position = 0.9, probability = 0, angle_when_stopped = asteroid_functions.medium_angle}
  },
  type_ratios =
  {
    {position = 0.1, ratios = asteroid_functions.axos_ratio},
    {position = 0.9, ratios = asteroid_functions.keria_ratio},
  }
}

-- Dati di transizione da Nauvis a Vulcanus.
-- Ogni sezione definisce probabilita e rapporti da interpolare in base alla posizione.
asteroid_functions.nauvis_vulcanus =
{
  probability_on_range_chunk =
  {
    {position = 0.1, probability = asteroid_functions.nauvis_chunks, angle_when_stopped = asteroid_functions.chunk_angle},
    {position = 0.9, probability = asteroid_functions.vulcanus_chunks, angle_when_stopped = asteroid_functions.chunk_angle}
  },
  probability_on_range_medium =
  {
    {position = 0.1, probability = 0, angle_when_stopped = asteroid_functions.medium_angle},
    {position = 0.5, probability = asteroid_functions.vulcanus_medium * 3, angle_when_stopped = asteroid_functions.medium_angle},
    {position = 0.9, probability = asteroid_functions.vulcanus_medium, angle_when_stopped = asteroid_functions.medium_angle}
  },
  type_ratios =
  {
    {position = 0.1, ratios = asteroid_functions.nauvis_ratio},
    {position = 0.9, ratios = asteroid_functions.vulcanus_ratio},
  }
}

-- Dati di transizione da Nauvis a Gleba.
asteroid_functions.nauvis_gleba =
{
  probability_on_range_chunk =
  {
    {position = 0.1, probability = asteroid_functions.nauvis_chunks, angle_when_stopped = asteroid_functions.chunk_angle},
    {position = 0.9, probability = asteroid_functions.gleba_chunks, angle_when_stopped = asteroid_functions.chunk_angle}
  },
  probability_on_range_medium =
  {
    {position = 0.1, probability = 0, angle_when_stopped = asteroid_functions.medium_angle},
    {position = 0.5, probability = asteroid_functions.gleba_medium * 3, angle_when_stopped = asteroid_functions.medium_angle},
    {position = 0.9, probability = asteroid_functions.gleba_medium, angle_when_stopped = asteroid_functions.medium_angle}
  },
  type_ratios =
  {
    {position = 0.1, ratios = asteroid_functions.nauvis_ratio},
    {position = 0.9, ratios = asteroid_functions.gleba_ratio},
  }
}

-- Dati di transizione da Nauvis a Fulgora.
asteroid_functions.nauvis_fulgora =
{
  probability_on_range_chunk =
  {
    {position = 0.1, probability = asteroid_functions.nauvis_chunks, angle_when_stopped = asteroid_functions.chunk_angle},
    {position = 0.9, probability = asteroid_functions.fulgora_chunks, angle_when_stopped = asteroid_functions.chunk_angle}
  },
  probability_on_range_medium =
  {
    {position = 0.1, probability = 0, angle_when_stopped = asteroid_functions.medium_angle},
    {position = 0.5, probability = asteroid_functions.fulgora_medium * 3, angle_when_stopped = asteroid_functions.medium_angle},
    {position = 0.9, probability = asteroid_functions.fulgora_medium, angle_when_stopped = asteroid_functions.medium_angle}
  },
  type_ratios =
  {
    {position = 0.1, ratios = asteroid_functions.nauvis_ratio},
    {position = 0.9, ratios = asteroid_functions.fulgora_ratio},
  }
}

-- Dati di transizione da Vulcanus a Gleba.
asteroid_functions.vulcanus_gleba =
{
  probability_on_range_chunk =
  {
    {position = 0.1, probability = asteroid_functions.vulcanus_chunks, angle_when_stopped = asteroid_functions.chunk_angle},
    {position = 0.9, probability = asteroid_functions.gleba_chunks, angle_when_stopped = asteroid_functions.chunk_angle}
  },
  probability_on_range_medium =
  {
    {position = 0.1, probability = asteroid_functions.vulcanus_medium, angle_when_stopped = asteroid_functions.medium_angle},
    {position = 0.5, probability = asteroid_functions.weighted_average(asteroid_functions.vulcanus_medium, asteroid_functions.gleba_medium, 0.5) * 3, angle_when_stopped = asteroid_functions.medium_angle},
    {position = 0.9, probability = asteroid_functions.gleba_medium, angle_when_stopped = asteroid_functions.medium_angle}
  },
  type_ratios =
  {
    {position = 0.1, ratios = asteroid_functions.vulcanus_ratio},
    {position = 0.9, ratios = asteroid_functions.gleba_ratio},
  }
}

-- Dati di transizione da Gleba a Fulgora.
asteroid_functions.gleba_fulgora =
{
  probability_on_range_chunk =
  {
    {position = 0.1, probability = asteroid_functions.gleba_chunks, angle_when_stopped = asteroid_functions.chunk_angle},
    {position = 0.9, probability = asteroid_functions.fulgora_chunks, angle_when_stopped = asteroid_functions.chunk_angle}
  },
  probability_on_range_medium =
  {
    {position = 0.1, probability = asteroid_functions.gleba_medium, angle_when_stopped = asteroid_functions.medium_angle},
    {position = 0.5, probability = asteroid_functions.weighted_average(asteroid_functions.gleba_medium, asteroid_functions.fulgora_medium, 0.5) * 3, angle_when_stopped = asteroid_functions.medium_angle},
    {position = 0.9, probability = asteroid_functions.fulgora_medium, angle_when_stopped = asteroid_functions.medium_angle}
  },
  type_ratios =
  {
    {position = 0.1, ratios = asteroid_functions.gleba_ratio},
    {position = 0.9, ratios = asteroid_functions.fulgora_ratio},
  }
}

-- Dati di transizione da Gleba ad Aquilo.
asteroid_functions.gleba_aquilo =
{
  probability_on_range_chunk =
  {
    {position = 0.1, probability = asteroid_functions.gleba_chunks, angle_when_stopped = asteroid_functions.chunk_angle},
    {position = 0.9, probability = asteroid_functions.aquilo_chunks, angle_when_stopped = asteroid_functions.chunk_angle}
  },
  probability_on_range_medium =
  {
    {position = 0.1, probability = asteroid_functions.gleba_medium, angle_when_stopped = asteroid_functions.medium_angle},
    {position = 0.9, probability = 0, angle_when_stopped = asteroid_functions.medium_angle}
  },
  probability_on_range_big =
  {
    {position = 0.1, probability = 0, angle_when_stopped = asteroid_functions.big_angle},
    {position = 0.9, probability = asteroid_functions.aquilo_big, angle_when_stopped = asteroid_functions.big_angle}
  },
  type_ratios =
  {
    {position = 0.1, ratios = asteroid_functions.gleba_ratio},
    {position = 0.4, ratios = asteroid_functions.aquilo_ratio},
    {position = 0.9, ratios = asteroid_functions.aquilo_ratio}
  }
}

-- Dati di transizione da Fulgora ad Aquilo.
asteroid_functions.fulgora_aquilo =
{
  probability_on_range_chunk =
  {
    {position = 0.1, probability = asteroid_functions.fulgora_chunks, angle_when_stopped = asteroid_functions.chunk_angle},
    {position = 0.9, probability = asteroid_functions.aquilo_chunks, angle_when_stopped = asteroid_functions.chunk_angle}
  },
  probability_on_range_medium =
  {
    {position = 0.1, probability = asteroid_functions.fulgora_medium, angle_when_stopped = asteroid_functions.medium_angle},
    {position = 0.9, probability = 0, angle_when_stopped = asteroid_functions.medium_angle}
  },
  probability_on_range_big =
  {
    {position = 0.1, probability = 0, angle_when_stopped = asteroid_functions.big_angle},
    {position = 0.9, probability = asteroid_functions.aquilo_big, angle_when_stopped = asteroid_functions.big_angle}
  },
  type_ratios =
  {
    {position = 0.1, ratios = asteroid_functions.fulgora_ratio},
    {position = 0.4, ratios = asteroid_functions.aquilo_ratio},
    {position = 0.9, ratios = asteroid_functions.aquilo_ratio}
  }
}

-- Dati di transizione da Aquilo al bordo del sistema solare.
-- Qui compaiono asteroidi piu grandi e anche il promethium.
asteroid_functions.aquilo_solar_system_edge =
{
  probability_on_range_chunk =
  {
    {position = 0.1, probability = asteroid_functions.aquilo_chunks, angle_when_stopped = asteroid_functions.chunk_angle},
    {position = 0.9, probability = asteroid_functions.system_edge_chunks, angle_when_stopped = asteroid_functions.chunk_angle}
  },
  probability_on_range_big =
  {
    {position = 0.1, probability = asteroid_functions.aquilo_big, angle_when_stopped = asteroid_functions.big_angle},
    {position = 0.9, probability = 0, angle_when_stopped = asteroid_functions.big_angle}
  },
  probability_on_range_huge =
  {
    {position = 0.1, probability = 0, angle_when_stopped = asteroid_functions.huge_angle},
    {position = 0.9, probability = asteroid_functions.system_edge_huge, angle_when_stopped = asteroid_functions.huge_angle}
  },
  type_ratios =
  {
    {position = 0.1, ratios = asteroid_functions.aquilo_ratio},
    {position = 0.2, ratios = {2,3,10, 0}},
    {position = 0.3, ratios = {4,2,8, 0}},
    {position = 0.4, ratios = {6,1,4, 0}},
    {position = 0.5, ratios = {9,4,3, 0}},
    {position = 0.6, ratios = {9,5,2, 0}},
    {position = 0.7, ratios = {9,2,7, 0}},
    {position = 0.8, ratios = {3,5,1, 0}},
    {position = 0.9, ratios = asteroid_functions.system_edge_ratio},
  }
}

-- Dati per il viaggio verso il pianeta fratturato.
-- Questa tratto abilita anche gli asteroidi al promethium.
asteroid_functions.shattered_planet_trip =
{
  has_promethium_asteroids = true,
  probability_on_range_huge   =
  {
    {position = 0.001, probability = asteroid_functions.system_edge_huge, angle_when_stopped = asteroid_functions.huge_angle},
    {position = 0.999, probability = 0.111, angle_when_stopped = asteroid_functions.huge_angle}
  },
  type_ratios =
  {
    {position = 0.001, ratios = asteroid_functions.system_edge_ratio},
    {position = 0.002, ratios = { 0,5/10*16,2/10*16,  0.04, 3/10*16, 3/10*16 , 3/10*16, 0  }},-- 3 5 2
    {position = 0.2,   ratios = { 0,3,8,    0.40, 5, 5 , 5, 0 }},
    {position = 0.3,   ratios = { 0,9,4,    2.03, 3, 3 , 3, 0 }},
    {position = 0.4,   ratios = { 0,6,3,    6.40, 7, 7 , 7, 0 }},
    {position = 0.5,   ratios = { 0,2,5,   15.63, 9, 9 , 9, 0 }},
    {position = 0.6,   ratios = { 0,6,8,   32.40, 2, 2 , 2, 0 }},
    {position = 0.7,   ratios = { 0,2,5,   60.03, 8, 8 , 8, 0 }},
    {position = 0.8,   ratios = { 0,9,4,  102.40, 3, 3 , 3, 0 }},
    {position = 0.9,   ratios = { 0,9,4,  131.40, 3, 3 , 3, 0 }},
    {position = 0.999, ratios = { 0,2,4, 164.03, 10, 10 , 10, 0 }},
  }
}

-- Utility semplice: ricerca lineare di un elemento dentro una tabella.
-- Ritorna true se il valore e presente, false altrimenti.
asteroid_functions.search_in_table = function(table, key)
  local found = false
  for k, entry in pairs(table) do
    if entry == key then
      found = true
      return found
    end
  end
  return found
end

-- Individua il punto con posizione piu alta tra quelli <= position.
-- Usato per trovare il limite inferiore dell'interpolazione.
asteroid_functions.find_lower_point = function(position, data)
  local position_data = {position = 0}
  for k, data_point in pairs(data) do
    if data_point.position <= position and data_point.position > position_data.position then
      position_data = data_point
    end
  end
  return position_data
end

-- Individua il punto con posizione piu bassa tra quelli >= position.
-- Usato per trovare il limite superiore dell'interpolazione.
asteroid_functions.find_higher_point = function(position, data)
  local position_data = {position = 1}
  for k, data_point in pairs(data) do
    if data_point.position >= position then
      if data_point.position < position_data.position then
        position_data = data_point
      end
    end
  end
  return position_data
end

-- Interpola sia la probabilita sia l'angolo di arresto fra due punti dati.
-- Se i punti coincidono, restituisce direttamente il valore del primo punto.
asteroid_functions.interpolate_points = function(pointA, pointB, position)
  if pointA.position == pointB.position then
    return pointA.probability, pointA.angle_when_stopped or 1
  end
  local range = pointB.position - pointA.position
  local position_in_range = (position - pointA.position) / range
  local probability_difference = pointB.probability - pointA.probability
  local interpolated_probability = pointA.probability + position_in_range * probability_difference
  local angle_a = (pointA.angle_when_stopped or 1)
  local angle_b = (pointB.angle_when_stopped or 1)
  local angle_difference = angle_b - angle_a
  local interpolated_angle = angle_a + position_in_range * angle_difference
  return interpolated_probability, interpolated_angle
end

-- Normalizza un rapporto di pesi in modo che il valore massimo diventi 1.
-- Serve a confrontare correttamente i tipi di asteroide tra due punti.
asteroid_functions.normalize_ratio = function(ratio)
  local r = {}
  local max = 0
  for k, v in pairs(ratio) do
    if v > max then
      max = v
    end
  end
  for k, v in pairs(ratio) do
    table.insert(r, v/max)
  end
  return r
end

-- Interpola i rapporti tra due punti e produce il rapporto finale per ogni tipo.
-- Il risultato e un array di coefficienti gia normalizzati.
asteroid_functions.interpolate_point_ratio = function(pointA, pointB, position)
  local interpolated_data = {position = position, ratios = {1,1,1,1}}
  for k, r in pairs(pointA.ratios) do
    local interpolated_probability, interpolated_angle = asteroid_functions.interpolate_points(
      {position = pointA.position, probability = asteroid_functions.normalize_ratio(pointA.ratios)[k]},
      {position = pointB.position, probability = asteroid_functions.normalize_ratio(pointB.ratios)[k]},
      position
    )
    interpolated_data.ratios[k] = interpolated_probability
  end
  return interpolated_data.ratios
end

-- Costruisce gli spawn points per un singolo tipo di asteroide.
-- Se planet e nil, genera la curva lungo una tratta;
-- altrimenti calcola il valore puntuale per una singola location.
asteroid_functions.asteroid_spawn_point = function(asteroid_id, ratio_data, probability_data, planet)  -- get significant positions
  local significant_positions = {}
  for k, point in pairs(ratio_data) do
    table.insert(significant_positions, point.position)
  end

  for k, point in pairs(probability_data) do
    local point_is_already_in_table = asteroid_functions.search_in_table(significant_positions, point.position)
    if point_is_already_in_table == false then
      table.insert(significant_positions, point.position)
    end
  end

  table.sort(significant_positions)

  local spawn_points = {}
  -- fill every significant position with data and add it to spawn points
  for k, significant_position in pairs(significant_positions) do
    if planet == nil or planet == significant_position then
      -- Trova i punti di interpolazione per i rapporti e per la probabilita.
      local ratio_lower_point  = asteroid_functions.find_lower_point(significant_position, ratio_data)
      local ratio_higher_point = asteroid_functions.find_higher_point(significant_position, ratio_data)
      local interpolated_ratio = asteroid_functions.interpolate_point_ratio(ratio_lower_point, ratio_higher_point, significant_position)

      local probability_lower_point  = asteroid_functions.find_lower_point(significant_position, probability_data)
      local probability_higher_point = asteroid_functions.find_higher_point(significant_position, probability_data)
      local interpolated_probability, interpolated_angle = asteroid_functions.interpolate_points(probability_lower_point, probability_higher_point, significant_position)

      local spawn_point = {}
      if planet == nil then
        -- Tratta interplanetaria: la posizione viene mantenuta come distanza.
        spawn_point = {distance = significant_position, probability = interpolated_probability * interpolated_ratio[asteroid_id], speed = asteroid_functions.standard_speed, angle_when_stopped = interpolated_angle}
      else
        -- Location singola: la distanza non serve, conta solo la probabilita finale.
        spawn_point = {
          distance = significant_position,
          probability = interpolated_probability * interpolated_ratio[asteroid_id],
          speed = asteroid_functions.standard_speed,
          angle_when_stopped = interpolated_angle
        }
      end

      table.insert(spawn_points, spawn_point)
    end
  end

  return spawn_points
end

-- Verifica se tutte le probabilita in una lista sono zero.
-- Se lo sono, la definizione puo essere considerata vuota/irrilevante.
asteroid_functions.are_all_zero = function(table)
  local are_all_zero = true
  if table ~= nil then
    for k, v in pairs(table) do
      if v.probability ~= 0 then
        are_all_zero = false
      end
    end
  end
  return are_all_zero
end

-- Genera l'intero set di definizioni di spawn per una tratta o una location.
-- Quando planet e nil produce definizioni complete con spawn_points.
-- Quando planet e valorizzato produce la singola probabilita per quella location.
asteroid_functions.spawn_definitions = function(data, planet)
  local asteroid_spawn_definitions = {}
  local asteroid_sizes = {"chunk", "small", "medium", "big", "huge"}
  local asteroid_types = {"metallic", "carbonic", "oxide", "irony", "coppery", "rocky", "tungsten"}

  -- Su alcune tratte compare anche il promethium, quindi aggiungiamo il quarto tipo.
  if data.has_promethium_asteroids == true then
    asteroid_types = {"metallic", "carbonic", "oxide", "promethium", "irony", "coppery", "rocky", "tungsten"}
  end

  -- Cicla su tutte le combinazioni dimensione/tipo e costruisce il nome del prototipo.
  for k, asteroid_size in pairs(asteroid_sizes) do
    for k, asteroid_type in pairs(asteroid_types) do
      local asteroid_name = ""
      if asteroid_size == "chunk" then
        asteroid_name = asteroid_type .. "-asteroid-chunk"
      else
        asteroid_name = asteroid_size .. "-" .. asteroid_type .. "-asteroid"
      end

      local asteroid_id = 0
      -- Il tipo viene tradotto in un indice numerico per leggere i rapporti.
      if asteroid_type == "metallic" then
        asteroid_id = 1
      elseif asteroid_type == "carbonic" then
        asteroid_id = 2
      elseif asteroid_type == "oxide" then
        asteroid_id = 3
      elseif asteroid_type == "promethium" then
        asteroid_id = 4
      elseif asteroid_type == "irony" then
        asteroid_id = 5
      elseif asteroid_type == "coppery" then
        asteroid_id = 6
      elseif asteroid_type == "rocky" then
        asteroid_id = 7
      elseif asteroid_type == "tungsten" then
        asteroid_id = 8
      end

      local probability_data = {}
      -- Ogni dimensione usa una curva diversa di probabilita.
      if asteroid_size == "chunk" then
        probability_data = data.probability_on_range_chunk or {{position = 0.1, probability = 0, angle_when_stopped = asteroid_functions.chunk_angle}, {position = 0.9, probability = 0, angle_when_stopped = asteroid_functions.chunk_angle}}
      elseif asteroid_size == "small" then
        probability_data = data.probability_on_range_small or {{position = 0.1, probability = 0, angle_when_stopped = asteroid_functions.small_angle}, {position = 0.9, probability = 0, angle_when_stopped = asteroid_functions.small_angle}}
      elseif asteroid_size == "medium" then
        probability_data = data.probability_on_range_medium or {{position = 0.1, probability = 0, angle_when_stopped = asteroid_functions.medium_angle}, {position = 0.9, probability = 0, angle_when_stopped = asteroid_functions.medium_angle}}
      elseif asteroid_size == "big" then
        probability_data = data.probability_on_range_big or {{position = 0.1, probability = 0, angle_when_stopped = asteroid_functions.big_angle}, {position = 0.9, probability = 0, angle_when_stopped = asteroid_functions.big_angle}}
      elseif asteroid_size == "huge" then
        probability_data = data.probability_on_range_huge or {{position = 0.1, probability = 0, angle_when_stopped = asteroid_functions.huge_angle}, {position = 0.9, probability = 0, angle_when_stopped = asteroid_functions.huge_angle}}
      end

      -- Caso standard: si generano le definizioni lungo una rotta.
      if asteroid_functions.are_all_zero(probability_data) == false and planet == nil then
        local asteroid_definition =
        {
          asteroid = asteroid_name,
          spawn_points = asteroid_functions.asteroid_spawn_point(asteroid_id, data.type_ratios, probability_data, planet)
        }
        if asteroid_size == "chunk" then
          asteroid_definition.type = "asteroid-chunk"
        end
        table.insert(asteroid_spawn_definitions, asteroid_definition)
      end

      -- Caso specifico: si genera solo il valore valido per una singola location.
      if planet ~= nil then
        -- if it's specifying a planet, only care about the probability on that planet, not along the whole route
        local planet_probability = asteroid_functions.asteroid_spawn_point(asteroid_id, data.type_ratios, probability_data, planet)[1].probability
        if planet_probability then
          if planet_probability > 0 then
            local asteroid_definition =
            {
              asteroid = asteroid_name,
              probability = planet_probability,
              speed = asteroid_functions.standard_speed,
              angle_when_stopped = asteroid_functions[asteroid_size.."_angle"]
            }
            if asteroid_size == "chunk" then
              asteroid_definition.type = "asteroid-chunk"
            end
            table.insert(asteroid_spawn_definitions, asteroid_definition)
          end
        end
      end
    end
  end

  return asteroid_spawn_definitions
end

-- Espone il modulo al chiamante che effettua require().
return asteroid_functions